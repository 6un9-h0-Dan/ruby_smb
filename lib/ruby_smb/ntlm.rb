module RubySMB
  module NTLM
    # [[MS-NLMP] 2.2.2.5](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-nlmp/99d90ff4-957f-4c8a-80e4-5bfe5a9a9832)
    NEGOTIATE_FLAGS = {
      :UNICODE                  => 1 << 0,
      :OEM                      => 1 << 1,
      :REQUEST_TARGET           => 1 << 2,
      :SIGN                     => 1 << 4,
      :SEAL                     => 1 << 5,
      :DATAGRAM                 => 1 << 6,
      :LAN_MANAGER_KEY          => 1 << 7,
      :NTLM                     => 1 << 9,
      :NT_ONLY                  => 1 << 10,
      :ANONYMOUS                => 1 << 11,
      :OEM_DOMAIN_SUPPLIED      => 1 << 12,
      :OEM_WORKSTATION_SUPPLIED => 1 << 13,
      :ALWAYS_SIGN              => 1 << 15,
      :TARGET_TYPE_DOMAIN       => 1 << 16,
      :TARGET_TYPE_SERVER       => 1 << 17,
      :TARGET_TYPE_SHARE        => 1 << 18,
      :EXTENDED_SECURITY        => 1 << 19,
      :IDENTIFY                 => 1 << 20,
      :NON_NT_SESSION           => 1 << 22,
      :TARGET_INFO              => 1 << 23,
      :VERSION_INFO             => 1 << 25,
      :KEY128                   => 1 << 29,
      :KEY_EXCHANGE             => 1 << 30,
      :KEY56                    => 1 << 31
    }.freeze

    class OSVersion < BinData::Record
      endian :big

      uint8  :major
      uint8  :minor
      uint16 :build
      uint32 :ntlm_revision, initial_value: 15

      def to_s
        "Version #{major}.#{minor} (Build #{build}); NTLM Current Revision #{ntlm_revision}"
      end
    end
  end
end

