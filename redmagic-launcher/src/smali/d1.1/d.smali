.class public Ld1/d;
.super Ljava/lang/Object;
.source "DownloadAppBean.java"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:I

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:I

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Ld1/d;->e:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Ld1/d;->g:I

    .line 9
    .line 10
    sget-object v0, Lr1/l;->m:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const-string v1, "app_name"

    .line 17
    .line 18
    invoke-interface {p2, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const-string v2, "package_name"

    .line 23
    .line 24
    invoke-interface {p2, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const-string v3, "progress"

    .line 29
    .line 30
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const-string v4, "status"

    .line 35
    .line 36
    invoke-interface {p2, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sget-object v5, Lr1/l;->n:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {p2, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Ld1/d;->a:I

    .line 51
    .line 52
    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ld1/d;->b:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ld1/d;->c:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {p2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ld1/d;->f:Ljava/lang/String;

    .line 69
    .line 70
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Ld1/d;->d:I

    .line 75
    .line 76
    iput-object p5, p0, Ld1/d;->j:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p1}, Lx1/S;->s(Landroid/content/Context;)Z

    .line 79
    .line 80
    .line 81
    move-result p5

    .line 82
    if-nez p5, :cond_0

    .line 83
    .line 84
    const-string p3, "download_type"

    .line 85
    .line 86
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    const-string p4, "spread_type"

    .line 91
    .line 92
    invoke-interface {p2, p4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result p4

    .line 96
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getInt(I)I

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    iput p3, p0, Ld1/d;->g:I

    .line 101
    .line 102
    invoke-interface {p2, p4}, Landroid/database/Cursor;->getInt(I)I

    .line 103
    .line 104
    .line 105
    move-result p3

    .line 106
    iput p3, p0, Ld1/d;->e:I

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p5

    .line 113
    if-nez p5, :cond_1

    .line 114
    .line 115
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    iput p3, p0, Ld1/d;->g:I

    .line 120
    .line 121
    :cond_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    if-nez p3, :cond_2

    .line 126
    .line 127
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    iput p3, p0, Ld1/d;->e:I

    .line 132
    .line 133
    :cond_2
    const-string p3, "version_code"

    .line 134
    .line 135
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    invoke-interface {p2, p3}, Landroid/database/Cursor;->getInt(I)I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    iput p3, p0, Ld1/d;->i:I

    .line 144
    .line 145
    :goto_0
    invoke-interface {p2, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    if-eqz p2, :cond_4

    .line 150
    .line 151
    array-length p3, p2

    .line 152
    if-nez p3, :cond_3

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_3
    const/4 p3, 0x0

    .line 156
    array-length p4, p2

    .line 157
    invoke-static {p2, p3, p4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-static {p1, p2}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, p0, Ld1/d;->h:Landroid/graphics/drawable/Drawable;

    .line 166
    .line 167
    return-void

    .line 168
    :cond_4
    :goto_1
    const/4 p1, 0x0

    .line 169
    iput-object p1, p0, Ld1/d;->h:Landroid/graphics/drawable/Drawable;

    .line 170
    .line 171
    return-void
.end method
