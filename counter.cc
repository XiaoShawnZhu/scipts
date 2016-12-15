#include<iostream>
#include<string>
#include<sstream>
#include<cstdlib>
#include<fstream>
#include<unistd.h>
#include<time.h>

using namespace std;

int main()
{
	int rc=0;      //ltq counter value
	int tc=0;      //lrq counter value
	int rq=0;      //receiver queue
	int tq=0;      //transmitter queue
	int rr=0;      //normalized counter value @ ltq
	int tt=0;      //normalized counter value @ lrq
	clock_t t0,t;
	string str3,str4,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
	t0=clock();
	fstream fileth0("eth0.txt");
	system("netstat -i | grep 'eth0' > 'eth0.txt' ");
	getline(fileth0,str4);
	istringstream str2(str4);
	str2>>c3>>c4>>c5>>c6>>c7>>c8>>c9>>c10;
	int toffset=atoi(c6.c_str());                 //initial # of pkts value
	int roffset=atoi(c10.c_str());
	while(1)
	{
		ofstream lrq("/proc/sys/net/ipv4/tcp_lrq");   //sys variable
		ofstream ltq("/proc/sys/net/ipv4/tcp_ltq");
		fstream fileth0("eth0.txt");         //open a file
		system("netstat -i | grep 'eth0' > 'eth0.txt' ");  //write nic information to file eth0.txt		
		getline(fileth0,str4);       //read line from file eth0.txt
		istringstream str2(str4);    //seperate this line
		str2>>c3>>c4>>c5>>c6>>c7>>c8>>c9>>c10;		
		//system("sudo sysctl -w net.ipv4.tcp_ecn=2");
		int nt=atoi(c6.c_str())-toffset;           //get the # of new pkts in this round
		int nr=atoi(c10.c_str())-roffset;          
		t=clock();  //ms
		if(rc>(t-t0)*1e3) rc=nr-rq+(rc-(t-t0)*1e3);   //counter value update
		else rc=nr-rq;
		if(tc>(t-t0)*1e3) tc=nt-tq+(tc-(t-t0)*1e3);
		else tc=nt-tq;		
		t0=clock();
		rq=nr;
		tq=nt;
		//cout<<n<<endl;
		if(rc/5000>15) 
			rr=15;      
		else rr=rc/5000;				 //counter value normalization
		if(tc/5000>15) 
			tt=15;
		else tt=tc/5000;	
		lrq<<tt;   
		ltq<<rr;
		cout<<rr<<" "<<tt<<endl;
		sleep(1);  //second
		cout<<c3<<" "<<c4<<" "<<endl;
		cout<<rq<<" "<<rc<<" "<<tq<<" "<<tc<<" "<<nt<<" "<<nr<<endl;
	}
	//filetx.close();
	//filerx.close();
	return 0;
}
