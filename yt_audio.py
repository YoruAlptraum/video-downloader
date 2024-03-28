from pytube import YouTube

def download_from_url(url, save_path):
    try:
        yt = YouTube(url)
        # to use with videos
        # stream = yt.streams.get_highest_resolution()
        stream = yt.streams.filter(only_audio=True).first()
        stream.download(output_path=save_path, filename=stream.default_filename.replace('.mp4','.mp3'))

        print("Download completed")
    except Exception as e:
        print(f"An error occurred: {e} peko")

url = 'https://www.youtube.com/watch?v=dcGAgwCfqf4&list=RDMM6Qb43htbKHg&index=3'  
save_path = '.'  # directory to save the downloaded video
download_from_url(url, save_path)

