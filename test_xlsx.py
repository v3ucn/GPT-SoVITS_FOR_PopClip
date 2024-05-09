import openpyxl
import sys
import logging

logging.basicConfig(level=logging.DEBUG,#控制台打印的日志级别
                    filename='new.log',
                    filemode='w',##模式，有w和a，w就是写模式，每次都会重新写日志，覆盖之前的日志
                    #a是追加模式，默认如果不写的话，就是追加模式
                    format=
                    '%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s'
                    #日志格式
                    )


def main():

    file_path = "/Users/liuyue/Downloads/popclip-extend/test.xlsx"

    try:
        text = sys.argv[1]
    except Exception as e:
        print(e)
        logging.debug(e)
        print("文本为空")
        exit(-1)

    print(text)
    logging.debug(text)

    # 加载存在的工作簿：
    wb = openpyxl.load_workbook(file_path)
    
    # 打开指定的工作簿中的指定工作表：
    ws = wb["Sheet1"]
    
    ws = wb.active  # 打开激活的工作表

    data_list = [text]
    
    # 追加数据：
    ws.append(data_list)
    
    # 保存修改：
    wb.save(file_path)


if __name__ == '__main__':
    main()
