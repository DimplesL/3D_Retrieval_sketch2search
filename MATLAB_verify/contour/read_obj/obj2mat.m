%���ļ�Ϊ�������ļ�����obj�ļ��ŵ���ǰĿ¼��data�ļ�������
%����õ�mat�ļ����ͱ����ڵ�ǰĿ¼���档
%mat�ռ����������ʽ��data:�������
%                   faces��������Ƭ������

%ע���������ֻ�ܶ�ȡֻ�������֮��Ĺ�ϵ�����ܺ����з��ߣ����� �ȵ���Ϣ

%%
%�ҵ�data�ļ��·ŵ�obj�ļ�
rootDir = [pwd,'\','data'];%ֱ������·��
rootDirInfo = dir(rootDir);
[rootDirNo, t] = size(rootDirInfo);%ȷ��Ŀ¼���ж����ļ�

%%
%��ÿһ��obj�ļ����ж�ȡ��������Զ���������
for fileIndex = 3:rootDirNo
    fileName =  rootDirInfo(fileIndex).name
    l=length(fileName); %�õ��ļ�������
    tempname =fileName(1:(l-4));%�õ�.matǰ�������
    name = [tempname,'.mat']
    filepath = [rootDir,'\',fileName]
    [data,faces] = readObj_v_f(filepath);
    save(name,'data','faces');
    clear ('data','faces'); 
end


