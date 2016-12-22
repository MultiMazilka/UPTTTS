echo "Starting up Garry's Mod 13 server."
screen -A -m -d -S gmod ./server_1/srcds_run -console -game garrysmod +map rp_industrial17_v1 +gamemode cwhl2rp -maxplayers 42 -autoupdate -authkey 3E8849652F3F0CB25232C9B6BFA910A6 +host_workshop_collection 801702586 -autoupdate
echo "Started. Type screen -x to resume!"