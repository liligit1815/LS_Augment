.class public Landroidx/slice/SliceItemHolder;
.super Ljava/lang/Object;
.source "SliceItemHolder.java"

# interfaces
.implements Ll0/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/SliceItemHolder$a;
    }
.end annotation


# static fields
.field public static final h:Ljava/lang/Object;


# instance fields
.field public a:Ll0/a;

.field b:Landroid/os/Parcelable;

.field c:Ljava/lang/Object;

.field d:Ljava/lang/String;

.field e:I

.field f:J

.field private g:Landroidx/slice/SliceItemHolder$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/slice/SliceItemHolder;->h:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>(Landroidx/slice/SliceItemHolder$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 3
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 4
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/slice/SliceItemHolder;->e:I

    const-wide/16 v0, 0x0

    .line 6
    iput-wide v0, p0, Landroidx/slice/SliceItemHolder;->f:J

    .line 7
    iput-object p1, p0, Landroidx/slice/SliceItemHolder;->g:Landroidx/slice/SliceItemHolder$a;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 3

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 10
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 11
    iput-object v0, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Landroidx/slice/SliceItemHolder;->e:I

    const-wide/16 v1, 0x0

    .line 13
    iput-wide v1, p0, Landroidx/slice/SliceItemHolder;->f:J

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "slice"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x6

    goto :goto_0

    :sswitch_1
    const-string v2, "input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x5

    goto :goto_0

    :sswitch_2
    const-string v2, "image"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x4

    goto :goto_0

    :sswitch_3
    const-string v2, "text"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x3

    goto :goto_0

    :sswitch_4
    const-string v2, "long"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_5
    const-string v2, "int"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_6
    const-string v2, "action"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    move v1, v0

    :goto_0
    packed-switch v1, :pswitch_data_0

    goto :goto_3

    .line 15
    :pswitch_0
    check-cast p2, Landroid/os/Parcelable;

    iput-object p2, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    goto :goto_3

    .line 16
    :pswitch_1
    check-cast p2, Ll0/a;

    iput-object p2, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    goto :goto_3

    .line 17
    :pswitch_2
    instance-of p1, p2, Landroid/text/Spanned;

    if-eqz p1, :cond_7

    check-cast p2, Landroid/text/Spanned;

    invoke-static {p2, v0}, LH/b;->b(Landroid/text/Spanned;I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_7
    move-object p1, p2

    check-cast p1, Ljava/lang/String;

    :goto_1
    iput-object p1, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    goto :goto_3

    .line 18
    :pswitch_3
    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Landroidx/slice/SliceItemHolder;->f:J

    goto :goto_3

    .line 19
    :pswitch_4
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroidx/slice/SliceItemHolder;->e:I

    goto :goto_3

    .line 20
    :pswitch_5
    check-cast p2, LI/d;

    iget-object p1, p2, LI/d;->a:Ljava/lang/Object;

    instance-of v0, p1, Landroid/app/PendingIntent;

    if-eqz v0, :cond_8

    .line 21
    check-cast p1, Landroid/os/Parcelable;

    iput-object p1, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    goto :goto_2

    :cond_8
    if-eqz p3, :cond_9

    .line 22
    :goto_2
    iget-object p1, p2, LI/d;->b:Ljava/lang/Object;

    check-cast p1, Ll0/a;

    iput-object p1, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    :goto_3
    return-void

    .line 23
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Cannot write callback to parcel"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_data_0
    .sparse-switch
        -0x54d081ca -> :sswitch_6
        0x197ef -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x36452d -> :sswitch_3
        0x5faa95b -> :sswitch_2
        0x5fb57ca -> :sswitch_1
        0x6873d92 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    sparse-switch v2, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v2, "slice"

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x6

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v2, "input"

    .line 26
    .line 27
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v1, 0x5

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v2, "image"

    .line 37
    .line 38
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v1, 0x4

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string v2, "text"

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v1, 0x3

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string v2, "long"

    .line 59
    .line 60
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v1, 0x2

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string v2, "int"

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    const/4 v1, 0x1

    .line 79
    goto :goto_0

    .line 80
    :sswitch_6
    const-string v2, "action"

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-nez v2, :cond_6

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    move v1, v0

    .line 90
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 91
    .line 92
    .line 93
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v1, "Unrecognized format "

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p0

    .line 116
    :pswitch_0
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 117
    .line 118
    return-object p0

    .line 119
    :pswitch_1
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 120
    .line 121
    return-object p0

    .line 122
    :pswitch_2
    iget-object p1, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p1, :cond_8

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_7

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_7
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p0, v0}, LH/b;->a(Ljava/lang/String;I)Landroid/text/Spanned;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0

    .line 140
    :cond_8
    :goto_1
    const-string p0, ""

    .line 141
    .line 142
    return-object p0

    .line 143
    :pswitch_3
    iget-wide p0, p0, Landroidx/slice/SliceItemHolder;->f:J

    .line 144
    .line 145
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :pswitch_4
    iget p0, p0, Landroidx/slice/SliceItemHolder;->e:I

    .line 151
    .line 152
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    return-object p0

    .line 157
    :pswitch_5
    iget-object p1, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 158
    .line 159
    if-nez p1, :cond_9

    .line 160
    .line 161
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 162
    .line 163
    if-nez v0, :cond_9

    .line 164
    .line 165
    const/4 p0, 0x0

    .line 166
    return-object p0

    .line 167
    :cond_9
    new-instance v0, LI/d;

    .line 168
    .line 169
    if-eqz p1, :cond_a

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_a
    iget-object p1, p0, Landroidx/slice/SliceItemHolder;->c:Ljava/lang/Object;

    .line 173
    .line 174
    :goto_2
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 175
    .line 176
    check-cast p0, Landroidx/slice/Slice;

    .line 177
    .line 178
    invoke-direct {v0, p1, p0}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    return-object v0

    .line 182
    nop

    .line 183
    :sswitch_data_0
    .sparse-switch
        -0x54d081ca -> :sswitch_6
        0x197ef -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x36452d -> :sswitch_3
        0x5faa95b -> :sswitch_2
        0x5fb57ca -> :sswitch_1
        0x6873d92 -> :sswitch_0
    .end sparse-switch

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->g:Landroidx/slice/SliceItemHolder$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroidx/slice/SliceItemHolder$a;->b(Landroidx/slice/SliceItemHolder;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
