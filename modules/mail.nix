{config, pkgs, ...}: {
	sops.secrets."diana/mailadmin" = {
		owner="root";
		path="/var/lib/sops-nix/mail/admin";
	};
	sops.secrets."diana/mailflamin" = {
		owner="root";
		path="/var/lib/sops-nix/mail/flamin";
	};
	sops.secrets."diana/mailsarita" = {
		owner="root";
		path="/var/lib/sops-nix/mail/sarita";
	};
	sops.secrets."diana/mailvirendra" = {
		owner="root";
		path="/var/lib/sops-nix/mail/virendra";
	};
	mailserver = {
		enable = true;
		stateVersion = 3;
		localDnsResolver = false;
		fqdn = "server.flamindemigod.com";
		domains = [ "flamindemigod.com" "pitstopz.com" ];
		x509.useACMEHost = config.mailserver.fqdn;
		loginAccounts = {
			"admin@flamindemigod.com" =  {
				hashedPasswordFile = config.sops.secrets."diana/mailadmin".path;
				aliases = ["postmaster@flamindemigod.com" "admin@pitstopz.com" "postmaster@pitstopz.com"];
			};
			"flamin@flamindemigod.com" =  {
				hashedPasswordFile = config.sops.secrets."diana/mailflamin".path;
				aliases = [ "flamey@flamindemigod.com" "flamin@pitstopz.com" ];
			};
			"dump@flamindemigod.com" =  {
				hashedPasswordFile = config.sops.secrets."diana/mailflamin".path;
				aliases = [ "dump@pitstopz.com" ];
			};
			"sarita@pitstopz.com" =  {
				hashedPasswordFile = config.sops.secrets."diana/mailsarita".path;
				aliases = [ "manager@pitstopz.com" "GM@pitstopz.com" ];
			};
			"virendra@pitstopz.com" =  {
				hashedPasswordFile = config.sops.secrets."diana/mailflamin".path;
				aliases = [ "inquiries@pitstopz.com" "proprietor@pitstopz.com" ];
			};
		};
 		# Use Let's Encrypt certificates. Note that this needs to set up a stripped
    		# down nginx and opens port 80.
		dmarcReporting.enable = true;
	};
	security.acme = {
		defaults.email = "postmaster@flamindemigod.com";
		acceptTerms = true;
		certs.${config.mailserver.fqdn} = {
			domain = config.mailserver.fqdn;
			dnsProvider = "cloudflare";
			dnsPropagationCheck = true;
		};
	};
}
