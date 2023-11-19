# Part 1: Setting Up VirtualBox and Virtual Machines

## Download and Install VirtualBox and ISO Files

### Download Oracle VirtualBox:
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/1.png)

- Visit the [Oracle VirtualBox website](https://www.virtualbox.org/wiki/Downloads).
- Select the appropriate version for your operating system (Windows/Mac) and download it.
- Follow the installation instructions.

### Download Windows 10 ISO:

- Go to the [Windows 10 download page](https://www.microsoft.com/en-us/software-download/windows10).
- Complete the required selections (version, language) and download the 64-bit version.
- Remember the download location for later use.

### Download Server 2019 ISO:

- Visit the [Server 2019 download page](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019).
- Choose the ISO option and continue with the required information.
- Download the 64-bit version and note the download location.


## Creating the First Virtual Machine (Domain Controller)

### Create a New Virtual Machine in VirtualBox:
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/3.png)
- Open VirtualBox and select 'New'.
- Name the virtual machine (e.g., DC for Domain Controller).
- Choose 'Other Windows (64-bit)' and continue.
- Assign RAM (at least 2048 MB recommended).
- Create a virtual hard disk with default settings.

### Configure Virtual Machine Settings:
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/2.png)
- Go to 'Settings' of the newly created virtual machine.
- In 'Advanced', set 'Shared Clipboard' and 'Drag and Drop' to 'Bidirectional'.
- Under 'System', adjust the processor settings based on your system's capability (e.g., 4 cores).
- In the 'Network' section, set up two network adapters:
  - Adapter 1: Attached to 'NAT' (for internet access).
  - Adapter 2: Internal Network (for VirtualBox private network).

### Install Server 2019 on the Virtual Machine:

1. **Start the Virtual Machine:**
   - In Oracle VirtualBox, select the virtual machine you created for the Server 2019.
   - Start the machine by clicking the "Start" button.

2. **Mount the Server 2019 ISO:**
   - Upon starting the virtual machine, a window will prompt you to select a start-up disk.
   - Click on the folder icon and navigate to the location where you saved the Server 2019 ISO file.
   - Select the ISO file and click "Start" to boot from the ISO.

3. **Begin Installation Process:**
   - The Windows Setup window will appear. Choose your language, time, and keyboard preferences, then click "Next."
   - Click "Install now" to start the installation process.

4. **Enter Product Key (optional):**
   - If you have a product key for Server 2019, enter it when prompted.
   - If you do not have a key, you can click “I don’t have a product key” to proceed with the evaluation version.

5. **Select Installation Type:**
   - Choose the 'Desktop Experience' version for a graphical user interface.
   - This option is preferable for users who need a GUI rather than a command-line interface.

6. **Customize Installation (Advanced):**
   - Select the “Custom: Install Windows only (advanced)” option.
   - This will allow you to perform a clean installation.

7. **Partition the Hard Drive:**
   - If prompted to choose where to install Windows, select the unallocated space on the virtual hard drive.
   - Click "Next" to proceed. Windows will automatically create the necessary partitions.

8. **Complete the Installation:**
   - The installer will copy, expand, and install the necessary files. This process may take some time.
   - The virtual machine will reboot several times during the installation.

9. **Set Administrator Password:**
   - After installation, you’ll be prompted to set a password for the built-in Administrator account.
   - Choose a strong password as this account has full control over the server.

10. **Finalizing Setup:**
    - After setting the password, the server will finalize settings and take you to the Windows Server 2019 login screen.
    - Log in with the Administrator account to start using Windows Server 2019.


## Preparing the Domain Controller

### Install VM Guest Additions:

- Inside the VM, go to 'Devices' > 'Insert Guest Additions CD Image'.
- Run the installation and restart the VM later.

### Configure IP Addressing and Naming:
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/4.png)
1. **Access Network Settings:**
   - Inside the Server 2019 VM, navigate to the 'Network and Sharing Center'. This can be done by right-clicking the network icon in the system tray and selecting 'Open Network & Internet settings'. Then click on 'Network and Sharing Center'.
   - In the 'Network and Sharing Center', click on 'Change adapter settings' on the left panel.

2. **Identify and Rename Network Adapters:**
   - In the 'Network Connections' window, you'll see the network adapters available to your VM.
   - Identify the adapters as per their properties. Typically, one is connected to NAT (for Internet access) and the other is for the internal network (private network).
   - Right-click on the adapter connected to NAT, select 'Rename', and name it as 'Internet'.
   - Similarly, rename the other adapter connected to the internal network as 'Internal'.

3. **Configure Static IP for Internal Adapter:**
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/5.png)
   - Right-click on the 'Internal' network adapter and select 'Properties'.
   - In the list, find and select 'Internet Protocol Version 4 (TCP/IPv4)' and then click 'Properties'.
   - Switch from 'Obtain an IP address automatically' to 'Use the following IP address'.
   - Enter the IP address you want to assign to the server for internal communication, for example, `172.16.0.1`. Ensure that this IP address is suitable for your network's addressing scheme.
   - Enter the Subnet mask, which is typically `255.255.255.0` for a standard Class C network.
   - Leave the 'Default gateway' and 'Preferred DNS server' fields blank for the 'Internal' adapter.
   - Click 'OK' to save the changes and close the properties window.

5. **Set Server Name:**
![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/6.png)
   - To change the name of the server, right-click on 'This PC' or 'Computer' on the desktop or in File Explorer, and select 'Properties'.
   - In the 'System' window, click on 'Change settings' next to the computer name.
   - In the 'System Properties' window, under the 'Computer Name' tab, click 'Change...' to rename the computer.
   - Set a descriptive name for your server that reflects its role or function and click 'OK'.
   - You'll be prompted to restart the computer for the changes to take effect. Restart the VM to complete the naming process.


# Part 2: Configuring Active Directory and Networking

## Setting Up Active Directory

### Install Active Directory Domain Services (ADDS):

![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/7.png)

1. **Open Server Manager:**
   - On your Windows Server 2019 VM, open the Server Manager. This can usually be found in the taskbar or accessed through the Start menu.

2. **Initiate Add Roles and Features Wizard:**
   - In the Server Manager dashboard, click on 'Add roles and features'. This will open the Add Roles and Features Wizard.

3. **Begin Installation Process:**
   - In the wizard, click 'Next' to proceed past the initial 'Before You Begin' page.

4. **Select Installation Type:**
   - Choose 'Role-based or feature-based installation' and click 'Next'.

5. **Select Destination Server:**
   - Choose the server on which you want to install Active Directory Domain Services. By default, the local server is selected. Click 'Next' to continue.

6. **Choose Server Role:**
   - In the 'Select server roles' page, scroll down and find 'Active Directory Domain Services'.
   - Check the box next to 'Active Directory Domain Services'. A new window might pop up, indicating additional features that are required for ADDS. Click 'Add Features' to include these necessary components.

7. **Add Features:**
   - The wizard will automatically move you to the 'Features' section after you have selected ADDS. You don't typically need to select anything extra here unless you have specific features in mind.
   - Click 'Next' to proceed.

8. **ADDS Confirmation:**
   ![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/8.png)
   - You will be presented with a brief overview of ADDS and its functions. Review the information provided.
   - Click 'Next' to proceed.

10. **Finalize and Install:**
    ![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/9.png)
   - Finally, you will reach the 'Confirmation' page. Review your selections.
   - Click 'Install' to begin the installation process. This might take a few minutes.

11. **Post-Installation Steps:**
    - Once ADDS is installed, you will see a notification in the Server Manager indicating that post-deployment configuration is needed.
    - You will need to promote the server to a domain controller, which involves additional steps like creating a new domain in a new forest, setting up DNS, and defining an administrative password.


### Promote the Server to a Domain Controller:

1. **Access Notifications in Server Manager:**
   ![](https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/10.png)
   - After installing Active Directory Domain Services, click on the 'Notifications' flag icon at the top of the Server Manager.

3. **Initiate Promotion to Domain Controller:**
   - In the drop-down menu, select 'Promote this server to a domain controller'.

4. **Create a New Forest:**
   - In the Active Directory Domain Services Configuration Wizard, choose the option 'Add a new forest'.
   - Enter your desired domain name (e.g., `mydomain.com`) in the 'Root domain name' field.

5. **Set DSRM Password:**
   - Choose and set a Directory Services Restore Mode (DSRM) password. This password is critical for recovery in case of a failure and should be secured.

6. **Follow Configuration Steps:**
   - Proceed through the wizard, making any additional configurations as necessary for your environment.
   - Review your choices and click 'Next' to validate the configuration.

7. **Complete the Promotion Process:**
   - Click 'Install' to begin the promotion process. The server will automatically restart once the process completes.

## Configuring NAT and Routing

### Install Routing and Remote Access for NAT:

1. **Open Add Roles and Features:**
   - In Server Manager, navigate to 'Add Roles and Features'.

2. **Select Remote Access Role:**
   - In the wizard, continue until you reach the 'Select server roles' page.
   - Find and select 'Remote Access', then click 'Next'.

3. **Install Routing:**
   - In the features section, select 'Routing'. This is part of the Remote Access role.
   - Continue following the prompts, and click 'Install' to add the role to your server.

4. **Post-Installation Configuration:**
   - Once installed, go to 'Tools' in Server Manager and select 'Routing and Remote Access'.
   - Right-click your server and select 'Configure and Enable Routing and Remote Access'.

5. **Setup NAT:**
   - In the setup wizard, choose 'Network Address Translation (NAT)'.
   - Select the network adapter that connects to the external network (labeled as 'Internet').
   - Complete the wizard to enable NAT on the selected adapter.

### Configure DHCP Role:

1. **Install DHCP Server Role:**
   - Access 'Add Roles and Features' again in Server Manager.
   - On the 'Select server roles' page, check the 'DHCP Server' role.
   - Continue with the wizard and click 'Install' to add the DHCP role.

2. **Authorize DHCP in Domain:**
   - After installation, you need to authorize the DHCP server in your Active Directory domain.
   - This is usually prompted automatically or can be done from the DHCP management console.

3. **Open DHCP Management Console:**
   - Go to 'Tools' in Server Manager and open 'DHCP'.

4. **Create a New DHCP Scope:**
   - In the DHCP console, right-click on 'IPv4' and select 'New Scope'.
   - Name your scope (e.g., 'Internal Network') and define the IP range (e.g., `172.16.0.100` to `172.16.0.200`).

5. **Configure Scope Options:**
   - Set up the necessary options for your DHCP scope, such as:
     - Router (Default Gateway): Typically, this will be the server's internal IP address.
     - DNS Servers: Enter the IP address of your DNS server, which might be the same as your domain controller.

6. **Activate the Scope:**
   - Once configured, ensure to activate the scope for it to start serving IP addresses within the specified range.


## Setting up a PowerShell Script for Bulk User Creation

### Create Users with PowerShell Script:

- Prepare a PowerShell script to create users in Active Directory.
- [Download the script](https://github.com/Skunsara/Active-Directory-Projet/blob/main/userscirpt.ps1).
- Modify the script if necessary, particularly focusing on user details and the OU (Organizational Unit) where the users will be placed.
- Execute the script in PowerShell as an administrator, ensuring the execution policy allows the script to run.
- Verify the creation of users in 'Active Directory Users and Computers'.

# Part 3: Finalizing the Lab Setup with Client Configuration

## Creating and Configuring the Windows 10 Client VM

### Create a New Virtual Machine for Windows 10 Client:

- In VirtualBox, select 'New' to create a new virtual machine.
- Name it (e.g., 'Client1'), select 'Windows 10 (64-bit)' as the type, and proceed.
- Assign appropriate RAM (e.g., 2048 MB) and create a virtual hard disk.

### Adjust Client VM Settings:

- Access the settings of 'Client1'.
- In 'Network', set the network adapter to 'Internal Network' to connect to the domain controller's private network.

### Install Windows 10 on the Client VM:

- Start the 'Client1' VM and select the Windows 10 ISO file for installation.
- Follow the on-screen instructions, choosing 'Windows 10 Pro' for domain compatibility.
- Complete the installation process and perform initial setup steps.

## Joining the Domain and Final Testing

### Change Computer Name and Join Domain:

- On the Windows 10 client, go to 'Settings' > 'System' > 'About' > 'Rename this PC'.
- Name the PC (e.g., 'Client1') and select to join a domain.
- Enter the domain name (e.g., mydomain.com) and provide credentials of a user with domain join privileges.
- Restart and Log into the Domain Account:

- After joining the domain, restart the Windows 10 VM.
- At the login screen, select 'Other User' and log in with a domain account (e.g., user@mydomain.com).

### Verify Network Connectivity and Access:

- Once logged in, verify network connectivity by accessing the internet and pinging the domain controller.
- Test access to shared resources within the domain if available.

### Explore Active Directory Users and Computers on the Domain Controller:

- On the domain controller, open 'Active Directory Users and Computers'.
- Verify the 'Client1' computer is listed under the 'Computers' OU.
- Explore user accounts, organizational units, and other domain features.

### Final Validation:

- Confirm that the client VM can access domain resources and the internet.
- Ensure the DHCP server is assigning IP addresses correctly.
- Check that user accounts created through the PowerShell script are functional.

## Conclusion

You have successfully set up an Active Directory lab environment on your personal computer using VirtualBox. This environment includes a domain controller and a Windows 10 client, both configured to communicate within a virtual network. You can use this setup to experiment with Active Directory features, Windows networking, and various administrative tasks.
