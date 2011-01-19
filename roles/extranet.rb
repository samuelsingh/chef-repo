name "extranet"
description "Adds http/ftp access for extranet.mapofmedicine.com"
run_list "recipe[vsftpd]"

override_attributes(
  "vsftpd" => {
    "ftp_base" => "/var/shared/ftp",
    "ftp_host" => "ftp.mapofmedicine.com",
    "users" => {
      "csc" => {
        "uid" => "10500",
        "pwd_hash" => "$6$sq0MlFJZ$Y1UijZDhQwn0pQmx.n8yV6cmR/OyzOCjqpvr9xU/X9X65ENAjaakj2kEO.lY6t3kLZzXOnjZUhb7invcpi8Lo0"
      },
      "dev" => {
        "uid" => "10501",
        "pwd_hash" => "$6$ST/GLqZF$Me9Syc4feLlW87j57ROi.KwIR8qv2vvlumVYJuVCqK1GrM70T4Zp0IA30Am/4CcsIkeunBfNaHHdz.LeyOmTm1"
      },
      "nhschoices" => {
        "uid" => "10502",
        "pwd_hash" => "$6$VDEksNPO$j0cBsmcJvAar3/nfRx16sGmOcUwRjTTIiJkFT92.GS6TqC6pDHWbFBSc7dSDe741ve0gNRzQpQvind9PmPi7C."
      },
      "vitalpac" => {
        "uid" => "10503",
        "pwd_hash" => "$6$YY6DLSp0$yaUBh6lLEPtNCNKCyaE0oQ7hhAE48O9aj4XhaH.5qvVFwF88q.nPsT3.eekIkmIZ18EiCxQLWaXFBknu.ZIAP."
      }
    }
  }
)
