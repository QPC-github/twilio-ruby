##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class UsageList < ListResource
            class RecordList < ListResource
              class LastMonthList < ListResource
                ##
                # Initialize the LastMonthList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [LastMonthList] LastMonthList
                def initialize(version, account_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid}
                  @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records/LastMonth.json"
                end

                ##
                # Lists LastMonthInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [last_month.Category] category The category of usage.  See [Usage
                #   Categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories)
                #   below.
                # @param [Date] start_date Only include usage that has occurred on or after this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `StartDate=-30days` will make
                #   `StartDate` be 30 days before today.
                # @param [Date] end_date Only include usage that has occurred on or before this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `EndDate=+30days` will make
                #   `EndDate` be 30 days from today.
                # @param [Boolean] include_subaccounts The include_subaccounts
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records.  If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Array] Array of up to limit results
                def list(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, limit: nil, page_size: nil)
                  self.stream(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      include_subaccounts: include_subaccounts,
                      limit: limit,
                      page_size: page_size
                  ).entries
                end

                ##
                # Streams LastMonthInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [last_month.Category] category The category of usage.  See [Usage
                #   Categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories)
                #   below.
                # @param [Date] start_date Only include usage that has occurred on or after this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `StartDate=-30days` will make
                #   `StartDate` be 30 days before today.
                # @param [Date] end_date Only include usage that has occurred on or before this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `EndDate=+30days` will make
                #   `EndDate` be 30 days from today.
                # @param [Boolean] include_subaccounts The include_subaccounts
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit. Default is no limit.
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records. If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)

                  page = self.page(
                      category: category,
                      start_date: start_date,
                      end_date: end_date,
                      include_subaccounts: include_subaccounts,
                      page_size: limits[:page_size],
                  )

                  @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                end

                ##
                # When passed a block, yields LastMonthInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                def each
                  limits = @version.read_limits

                  page = self.page(page_size: limits[:page_size], )

                  @version.stream(page,
                                  limit: limits[:limit],
                                  page_limit: limits[:page_limit]).each {|x| yield x}
                end

                ##
                # Retrieve a single page of LastMonthInstance records from the API.
                # Request is executed immediately.
                # @param [last_month.Category] category The category of usage.  See [Usage
                #   Categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories)
                #   below.
                # @param [Date] start_date Only include usage that has occurred on or after this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `StartDate=-30days` will make
                #   `StartDate` be 30 days before today.
                # @param [Date] end_date Only include usage that has occurred on or before this
                #   date.  Format is YYYY-MM-DD.  All dates are in GMT.  As a convenience, you can
                #   also specify offsets to today.  For example, `EndDate=+30days` will make
                #   `EndDate` be 30 days from today.
                # @param [Boolean] include_subaccounts The include_subaccounts
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of LastMonthInstance
                def page(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                  params = Twilio::Values.of({
                      'Category' => category,
                      'StartDate' => Twilio.serialize_iso8601_date(start_date),
                      'EndDate' => Twilio.serialize_iso8601_date(end_date),
                      'IncludeSubaccounts' => include_subaccounts,
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  LastMonthPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of LastMonthInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of LastMonthInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  LastMonthPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.LastMonthList>'
                end
              end

              class LastMonthPage < Page
                ##
                # Initialize the LastMonthPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [LastMonthPage] LastMonthPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of LastMonthInstance
                # @param [Hash] payload Payload response from the API
                # @return [LastMonthInstance] LastMonthInstance
                def get_instance(payload)
                  LastMonthInstance.new(@version, payload, account_sid: @solution[:account_sid], )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.LastMonthPage>'
                end
              end

              class LastMonthInstance < InstanceResource
                ##
                # Initialize the LastMonthInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid A 34 character string that uniquely identifies this
                #   resource.
                # @return [LastMonthInstance] LastMonthInstance
                def initialize(version, payload, account_sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'account_sid' => payload['account_sid'],
                      'api_version' => payload['api_version'],
                      'category' => payload['category'],
                      'count' => payload['count'],
                      'count_unit' => payload['count_unit'],
                      'description' => payload['description'],
                      'end_date' => Twilio.deserialize_iso8601_date(payload['end_date']),
                      'price' => payload['price'].to_f,
                      'price_unit' => payload['price_unit'],
                      'start_date' => Twilio.deserialize_iso8601_date(payload['start_date']),
                      'subresource_uris' => payload['subresource_uris'],
                      'uri' => payload['uri'],
                      'usage' => payload['usage'],
                      'usage_unit' => payload['usage_unit'],
                  }
                end

                ##
                # @return [String] The Account that accrued the usage.
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] The api_version
                def api_version
                  @properties['api_version']
                end

                ##
                # @return [last_month.Category] The category of usage.
                def category
                  @properties['category']
                end

                ##
                # @return [String] The number of usage events.
                def count
                  @properties['count']
                end

                ##
                # @return [String] The units in which Count is measured.
                def count_unit
                  @properties['count_unit']
                end

                ##
                # @return [String] A human-readable description of the usage category.
                def description
                  @properties['description']
                end

                ##
                # @return [Date] The last date for which usage is included in this UsageRecord, formatted as YYYY-MM-DD.
                def end_date
                  @properties['end_date']
                end

                ##
                # @return [String] The total price of the usage, in the currency associated with the account.
                def price
                  @properties['price']
                end

                ##
                # @return [String] The currency in which Price is measured, in ISO 4127 format.
                def price_unit
                  @properties['price_unit']
                end

                ##
                # @return [Date] The first date for which usage is included in this UsageRecord, formatted as YYYY-MM-DD.
                def start_date
                  @properties['start_date']
                end

                ##
                # @return [String] Subresource Uris for this UsageRecord.
                def subresource_uris
                  @properties['subresource_uris']
                end

                ##
                # @return [String] The URI that returns only this UsageRecord, relative to https://api.
                def uri
                  @properties['uri']
                end

                ##
                # @return [String] The amount of billed usage.
                def usage
                  @properties['usage']
                end

                ##
                # @return [String] The units in which Usage is measured.
                def usage_unit
                  @properties['usage_unit']
                end

                ##
                # Provide a user friendly representation
                def to_s
                  "<Twilio.Api.V2010.LastMonthInstance>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  "<Twilio.Api.V2010.LastMonthInstance>"
                end
              end
            end
          end
        end
      end
    end
  end
end