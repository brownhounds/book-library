import { RequestMethod } from './common'

type RequestConfig = {
  headers?: HeadersInit
  queryParams?: Record<string, string>
  body?: unknown
}

export class BaseClient {
  constructor(private baseUrl: string) {}

  private buildUrl(endpoint: string, queryParams?: Record<string, string>): string {
    const url = new URL(`${this.baseUrl}${endpoint}`)
    if (queryParams) {
      Object.entries(queryParams).forEach(([key, value]) => url.searchParams.append(key, value))
    }
    return url.toString()
  }

  private async request<T>(
    endpoint: string,
    options: RequestInit,
    queryParams?: Record<string, string>
  ): Promise<T> {
    // This method should implement graceful error handling
    // For the sake of the exercise just let it crash
    // App should have built in global mechanism to handle errors gracefully
    const url = this.buildUrl(endpoint, queryParams)
    const response = await fetch(url, options)
    return await response.json()
  }

  public async get<T>(endpoint: string, config?: RequestConfig): Promise<T> {
    return this.request<T>(
      endpoint,
      {
        method: RequestMethod.GET,
        headers: {
          'Content-Type': 'application/json',
          ...config?.headers
        }
      },
      config?.queryParams
    )
  }

  public async put<T>(endpoint: string, config?: RequestConfig): Promise<T> {
    return this.request<T>(endpoint, {
      method: RequestMethod.PUT,
      headers: {
        'Content-Type': 'application/json',
        ...config?.headers
      },
      body: config?.body ? JSON.stringify(config.body) : undefined
    })
  }

  public async post<T>(endpoint: string, config?: RequestConfig): Promise<T> {
    return this.request<T>(endpoint, {
      method: RequestMethod.POST,
      headers: {
        'Content-Type': 'application/json',
        ...config?.headers
      },
      body: config?.body ? JSON.stringify(config.body) : undefined
    })
  }

  public async patch<T>(endpoint: string, config?: RequestConfig): Promise<T> {
    return this.request<T>(endpoint, {
      method: RequestMethod.PATCH,
      headers: {
        'Content-Type': 'application/json',
        ...config?.headers
      },
      body: config?.body ? JSON.stringify(config.body) : undefined
    })
  }
}
