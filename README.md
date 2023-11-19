# Active Directory Lab Setup

## Table of Contents
- [Introduction](#introduction)
- [Project Members](#project-members)
- [Project Goals](#project-goals)
- [Proposed Solutions](#proposed-solutions)
- [Test Scenarios](#test-scenarios)
- [Tools Employed](#tools-employed)
- [Project Outcomes](#project-outcomes)
- [Detailed Sections](#detailed-sections)
  - [Part 1: Setting Up VirtualBox and Virtual Machines](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-1-setting-up-virtualbox-and-virtual-machines)
  - [Part 2: Configuring Active Directory and Networking](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-2-configuring-active-directory-and-networking)
  - [Part 3: Finalizing the Lab Setup with Client Configuration](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-3-finalizing-the-lab-setup-with-client-configuration)
- [Conclusion](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#conclusion)

## Introduction
https://github.com/Skunsara/Active-Directory-Projet/blob/main/Screenshots/Network%20diagram.jpeg
This guide provides step-by-step instructions for setting up an Active Directory lab environment on your personal computer using VirtualBox. The lab consists of a domain controller and a Windows 10 client, both configured to communicate within a virtual network. This environment enables experimentation with Active Directory features, Windows networking, and various administrative tasks.

## Project Members

- Maikl (Project Lead): Spearheading the project with his expertise in network architecture and security protocols.

## Project Goals

The primary goals of this project are as follows:

1. **Create a Virtual Active Directory Lab:** Establish a virtual environment comprising a domain controller and a Windows 10 client for testing and learning Active Directory concepts.

2. **Configure Networking:** Set up network adapters, IP addressing, and DNS to enable communication between the domain controller and the client.

3. **Install and Configure Active Directory:** Install Active Directory Domain Services (ADDS) on the domain controller, promote it to a domain controller, and configure DNS settings.

4. **Implement NAT and Routing:** Enable Network Address Translation (NAT) and routing on the domain controller for internet access from the client.

5. **Set up DHCP:** Install and configure the DHCP server role to dynamically assign IP addresses to devices within the internal network.

6. **Automate User Creation:** Create a PowerShell script for bulk user creation in Active Directory.

7. **Create and Configure Windows 10 Client:** Set up a Windows 10 client VM, adjust network settings, and join it to the Active Directory domain.

8. **Verify Connectivity and Access:** Ensure proper network connectivity, domain join functionality, and access to shared resources.

## Proposed Solutions

This guide proposes a comprehensive approach to achieve the project goals. It covers VirtualBox setup, Active Directory installation, networking configuration, and client VM creation.

## Test Scenarios

The lab environment can be tested for the following scenarios:

1. **Domain Controller Setup:** Verify the successful installation and configuration of Active Directory on the domain controller.

2. **Networking Configuration:** Confirm proper IP addressing, naming, and network adapter settings.

3. **NAT and Routing:** Test internet connectivity from the Windows 10 client through the domain controller.

4. **DHCP Server:** Validate the DHCP server's ability to assign IP addresses within the specified range.

5. **PowerShell Script Execution:** Execute the PowerShell script for user creation and check for successful user entries in Active Directory.

6. **Windows 10 Client Integration:** Confirm successful domain join and explore domain features on the Windows 10 client.

## Tools Employed

The project utilizes the following tools:

- **VirtualBox:** For creating and managing virtual machines.
- **Windows Server 2019 ISO:** To install the Windows Server operating system.
- **Windows 10 ISO:** For installing the Windows 10 client operating system.
- **PowerShell:** For scripting and automating user creation in Active Directory.

## Project Outcomes

Upon completion of this project, you will have:

1. A functional Active Directory lab environment.
2. Understanding of Active Directory installation and configuration.
3. Proficiency in configuring networking, NAT, and routing for a virtual environment.
4. Experience in automating tasks using PowerShell.

## Detailed Sections

- [Part 1: Setting Up VirtualBox and Virtual Machines](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-1-setting-up-virtualbox-and-virtual-machines)
- [Part 2: Configuring Active Directory and Networking](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-2-configuring-active-directory-and-networking)
- [Part 3: Finalizing the Lab Setup with Client Configuration](https://github.com/Skunsara/Active-Directory-Projet/blob/main/install.md#part-3-finalizing-the-lab-setup-with-client-configuration)

## Conclusion

This guide equips you with the knowledge and practical experience to set up, configure, and experiment with Active Directory in a virtualized environment. The outcomes achieved through this project contribute to your understanding of essential concepts in Windows networking and system administration.
