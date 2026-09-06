.class public Lcom/android/launcher3/Z;
.super Lcom/android/launcher3/s;
.source "DefaultLayoutParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/Z$a;,
        Lcom/android/launcher3/Z$e;,
        Lcom/android/launcher3/Z$b;,
        Lcom/android/launcher3/Z$c;,
        Lcom/android/launcher3/Z$d;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Landroid/content/res/Resources;I)V
    .locals 7

    .line 1
    const-string v6, "favorites"

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move v5, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/s;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Landroid/content/res/Resources;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method protected n()Landroid/util/ArrayMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/Z$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$a;-><init>(Lcom/android/launcher3/Z;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "favorite"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/s$g;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$g;-><init>(Lcom/android/launcher3/s;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "shortcut"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/Z$e;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$e;-><init>(Lcom/android/launcher3/Z;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "resolve"

    .line 32
    .line 33
    invoke-virtual {v0, p0, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method protected o()Landroid/util/ArrayMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/Z$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$a;-><init>(Lcom/android/launcher3/Z;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "favorite"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/Z$b;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$b;-><init>(Lcom/android/launcher3/Z;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "appwidget"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/s$f;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$f;-><init>(Lcom/android/launcher3/s;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "searchwidget"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/s$g;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$g;-><init>(Lcom/android/launcher3/s;)V

    .line 39
    .line 40
    .line 41
    const-string v2, "shortcut"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/android/launcher3/Z$e;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$e;-><init>(Lcom/android/launcher3/Z;)V

    .line 49
    .line 50
    .line 51
    const-string v2, "resolve"

    .line 52
    .line 53
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/Z$c;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$c;-><init>(Lcom/android/launcher3/Z;)V

    .line 59
    .line 60
    .line 61
    const-string v2, "folder"

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    new-instance v1, Lcom/android/launcher3/Z$d;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lcom/android/launcher3/Z$d;-><init>(Lcom/android/launcher3/Z;)V

    .line 69
    .line 70
    .line 71
    const-string p0, "partner-folder"

    .line 72
    .line 73
    invoke-virtual {v0, p0, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method protected s(Lorg/xmlpull/v1/XmlPullParser;[I)V
    .locals 3

    .line 1
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object p0, Lcom/android/launcher3/s;->r:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "container"

    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v1, 0x1

    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/16 p0, -0x65

    .line 26
    .line 27
    aput p0, p2, v2

    .line 28
    .line 29
    const-string p0, "rank"

    .line 30
    .line 31
    invoke-static {p1, p0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    aput p0, p2, v1

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/16 p0, -0x64

    .line 43
    .line 44
    aput p0, p2, v2

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    aput p0, p2, v2

    .line 57
    .line 58
    :cond_1
    :try_start_0
    const-string p0, "screen"

    .line 59
    .line 60
    invoke-static {p1, p0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    aput p0, p2, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v0, "parseContainerAndScreen error,  not config ATTR_SCREEN!  out[1]: "

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    aget p2, p2, v1

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p2, " e:"

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string p1, "DefaultLayoutParser"

    .line 104
    .line 105
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    :goto_0
    return-void

    .line 109
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/s;->s(Lorg/xmlpull/v1/XmlPullParser;[I)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
