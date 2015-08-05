module Twilio
  module Resources
    module V2010
      class AccountInstance
        class SipList
          class CredentialListList < ListResource
            can :list, :get, :create
            command_alias :credential_lists
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/SIP/CredentialLists.json"
              instance_id_key 'sid'
              instance_class CredentialListInstance
              list_key 'credential_lists'
            end
          end
        
          class CredentialListInstance < InstanceResource
            can :update, :delete
            
            def initialize(client, inheritance={}, params={})
              super
              path "/Accounts/#{@account_sid}/SIP/CredentialList/#{@sid}.json"
              instance_id_key 'sid'
              dependent Twilio::Resources::V2010::AccountInstance::SipList::CredentialListInstance::CredentialList, {
                account_sid: @account_sid,
                credential_list_sid: @sid
              }
            end
          end
        end
      end
    end
  end
end