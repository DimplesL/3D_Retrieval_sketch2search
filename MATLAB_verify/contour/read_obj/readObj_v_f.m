
%���ø�ʽ��
%[skulldata,faces] = readObj_v_f();
%ע�����Ҫ�������

%%
%function [skulldata,faces] = readObj_v_f()

%��;����ȡobj��ʽ�ĵ����Ϣ�������˶�ȡ�����Ϣ
%[FileName,PathName]=uigetfile('*.obj','Select the max obj');


%%
%10.05.07 �޸�
function [data,faces] = readObj_v_f(FileName)
%FileName Ӧ����ȫ·������

[fid, message ] = fopen(FileName,'r');
 
if (fid == -1)
    disp(message); %��ʧ�ܵĻ������ش���
    return;
end

 vertexCount = 0;
 faceCount = 0;
 while 1
    [prefix,count]=fscanf(fid,'%s',1);%1 ����ֻ��һ������
    switch prefix
        case '#'
            tline=fgetl(fid);
        case 'v'
            vertexCount=vertexCount+1;
            [data(vertexCount,:),count]=fscanf(fid,'%f',3);
       case 'f'
            faceCount=faceCount+1;
            [faces(faceCount,:),count]=fscanf(fid,'%d',4);
        otherwise
            tline=fgetl(fid);
    end
    if count==0 
        break;
    end
    %faceCount;
    %vertexCount;
end


fclose(fid);%�ر��ļ�
fprintf('%s\n',FileName);
%fprintf('Finished!\n');%����������ʾ
fprintf('%d\n',faceCount);%����������ʾface�ĸ���
fprintf('%d\n',vertexCount);%����������ʾvertex�ĸ���




end