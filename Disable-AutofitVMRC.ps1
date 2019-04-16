# https://www.vgemba.net/vmware/powercli/VMConsole-Resolution-Change/
# https://serverfault.com/questions/830849/esxi-6-5-how-to-turn-off-autofit-window-automatic-display-resolution-change
# https://kb.vmware.com/s/article/52031

Connect-VIServer
$vm = Read-Host -Prompt 'Enter a VM name to edit'
Get-VM -Name $vm | New-AdvancedSetting -Name guestInfo.svga.wddm.modeset -Value FALSE -Confirm:$false
Get-VM -Name $vm | New-AdvancedSetting -Name guestInfo.svga.wddm.modesetCCD -Value FALSE -Confirm:$false
Get-VM -Name $vm | New-AdvancedSetting -Name guestInfo.svga.wddm.modesetLegacySingle -Value FALSE -Confirm:$false
Get-VM -Name $vm | New-AdvancedSetting -Name guestInfo.svga.wddm.modesetLegacyMulti -Value FALSE -Confirm:$false
Start-VM -VM $vm
