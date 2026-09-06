.class LY0/g$a;
.super Ljava/lang/Object;
.source "UnZipUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LY0/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field g:Ljava/util/zip/ZipFile;

.field h:Ljava/util/zip/ZipEntry;

.field i:Ljava/lang/String;

.field j:J

.field k:Ljava/lang/String;


# direct methods
.method constructor <init>(LY0/g;Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, LY0/g$a;->g:Ljava/util/zip/ZipFile;

    .line 5
    .line 6
    iput-object p3, p0, LY0/g$a;->h:Ljava/util/zip/ZipEntry;

    .line 7
    .line 8
    iput-object p4, p0, LY0/g$a;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/util/zip/ZipEntry;->getSize()J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iput-wide p1, p0, LY0/g$a;->j:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, LY0/g$a;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, LY0/g$a;->h:Ljava/util/zip/ZipEntry;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, LY0/g$a;->h:Ljava/util/zip/ZipEntry;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object v1, p0, LY0/g$a;->h:Ljava/util/zip/ZipEntry;

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, p0, LY0/g$a;->k:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    iput-object v1, p0, LY0/g$a;->k:Ljava/lang/String;

    .line 89
    .line 90
    :goto_0
    invoke-static {}, LY0/g;->a()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    new-array v2, v1, [B

    .line 95
    .line 96
    const/4 v3, 0x0

    .line 97
    :try_start_0
    new-instance v4, Ljava/io/BufferedInputStream;

    .line 98
    .line 99
    iget-object v5, p0, LY0/g$a;->g:Ljava/util/zip/ZipFile;

    .line 100
    .line 101
    iget-object p0, p0, LY0/g$a;->h:Ljava/util/zip/ZipEntry;

    .line 102
    .line 103
    invoke-virtual {v5, p0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-direct {v4, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 108
    .line 109
    .line 110
    :try_start_1
    new-instance p0, Ljava/io/FileOutputStream;

    .line 111
    .line 112
    invoke-direct {p0, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 113
    .line 114
    .line 115
    :goto_1
    const/4 v0, 0x0

    .line 116
    :try_start_2
    invoke-virtual {v4, v2, v0, v1}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    const/4 v5, -0x1

    .line 121
    if-eq v3, v5, :cond_3

    .line 122
    .line 123
    invoke-virtual {p0, v2, v0, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :catchall_0
    move-exception v0

    .line 128
    move-object v3, p0

    .line 129
    goto :goto_4

    .line 130
    :catch_0
    move-exception v0

    .line 131
    move-object v3, p0

    .line 132
    goto :goto_2

    .line 133
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :catch_1
    move-exception p0

    .line 141
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :catchall_1
    move-exception v0

    .line 146
    goto :goto_4

    .line 147
    :catch_2
    move-exception v0

    .line 148
    goto :goto_2

    .line 149
    :catchall_2
    move-exception v0

    .line 150
    move-object v4, v3

    .line 151
    goto :goto_4

    .line 152
    :catch_3
    move-exception v0

    .line 153
    move-object v4, v3

    .line 154
    :goto_2
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 155
    .line 156
    .line 157
    if-eqz v3, :cond_4

    .line 158
    .line 159
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 160
    .line 161
    .line 162
    :cond_4
    if-eqz v4, :cond_5

    .line 163
    .line 164
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 165
    .line 166
    .line 167
    :cond_5
    :goto_3
    return-void

    .line 168
    :goto_4
    if-eqz v3, :cond_6

    .line 169
    .line 170
    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 171
    .line 172
    .line 173
    goto :goto_5

    .line 174
    :catch_4
    move-exception p0

    .line 175
    goto :goto_6

    .line 176
    :cond_6
    :goto_5
    if-eqz v4, :cond_7

    .line 177
    .line 178
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 179
    .line 180
    .line 181
    goto :goto_7

    .line 182
    :goto_6
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 183
    .line 184
    .line 185
    :cond_7
    :goto_7
    throw v0
.end method
