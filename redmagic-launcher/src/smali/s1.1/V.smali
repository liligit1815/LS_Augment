.class public Ls1/V;
.super Ls1/T;
.source "LauncherIconProvider.java"


# static fields
.field private static final l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ls1/T$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ls1/T$c;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Lcom/android/launcher3/util/f;

.field private final k:Ln1/C;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 2
    .line 3
    sput-object v0, Ls1/V;->l:Ljava/util/Map;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ln1/C;Lcom/android/launcher3/util/f;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/T;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ls1/V;->k:Ln1/C;

    .line 5
    .line 6
    iput-object p3, p0, Ls1/V;->j:Lcom/android/launcher3/util/f;

    .line 7
    .line 8
    invoke-virtual {p2}, Ln1/C;->n()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ls1/V;->x(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private w()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ls1/T$c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ls1/V;->i:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Landroid/util/ArrayMap;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ls1/T;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const v2, 0x7f17000c

    .line 18
    .line 19
    .line 20
    :try_start_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 21
    .line 22
    .line 23
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    :try_start_1
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    :goto_0
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->next()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    const/4 v5, 0x1

    .line 33
    const/4 v6, 0x2

    .line 34
    if-eq v4, v6, :cond_1

    .line 35
    .line 36
    if-eq v4, v5, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    :goto_1
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->next()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    const/4 v7, 0x3

    .line 44
    if-ne v4, v7, :cond_2

    .line 45
    .line 46
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    if-le v7, v3, :cond_4

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :catchall_0
    move-exception v1

    .line 54
    goto :goto_3

    .line 55
    :cond_2
    :goto_2
    if-eq v4, v5, :cond_4

    .line 56
    .line 57
    if-eq v4, v6, :cond_3

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    const-string v4, "icon"

    .line 61
    .line 62
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_1

    .line 71
    .line 72
    const-string v4, "package"

    .line 73
    .line 74
    const/4 v7, 0x0

    .line 75
    invoke-interface {v2, v7, v4}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    const-string v8, "drawable"

    .line 80
    .line 81
    const/4 v9, 0x0

    .line 82
    invoke-interface {v2, v7, v8, v9}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    if-eqz v7, :cond_1

    .line 87
    .line 88
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-nez v8, :cond_1

    .line 93
    .line 94
    new-instance v8, Ls1/T$c;

    .line 95
    .line 96
    invoke-direct {v8, v1, v7}, Ls1/T$c;-><init>(Landroid/content/res/Resources;I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v4, v8}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    :try_start_2
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 104
    .line 105
    .line 106
    goto :goto_6

    .line 107
    :catch_0
    move-exception v1

    .line 108
    goto :goto_5

    .line 109
    :goto_3
    if-eqz v2, :cond_5

    .line 110
    .line 111
    :try_start_3
    invoke-interface {v2}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 112
    .line 113
    .line 114
    goto :goto_4

    .line 115
    :catchall_1
    move-exception v2

    .line 116
    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    :goto_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 120
    :goto_5
    const-string v2, "LIconProvider"

    .line 121
    .line 122
    const-string v3, "Unable to parse icon map"

    .line 123
    .line 124
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 125
    .line 126
    .line 127
    :goto_6
    iput-object v0, p0, Ls1/V;->i:Ljava/util/Map;

    .line 128
    .line 129
    return-object v0
.end method


# virtual methods
.method protected d(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/V;->j:Lcom/android/launcher3/util/f;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/f;->e(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected l(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/PackageItemInfo;Landroid/content/pm/ApplicationInfo;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/T;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ln1/C;

    .line 10
    .line 11
    invoke-virtual {v0}, Ln1/C;->n()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-boolean v0, Ls1/T;->h:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    iput-boolean v0, p0, Ls1/T;->e:Z

    .line 25
    .line 26
    invoke-super {p0, p1, p2, p3, p4}, Ls1/T;->l(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/PackageItemInfo;Landroid/content/pm/ApplicationInfo;I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method protected n(Ljava/lang/String;)Ls1/T$c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ls1/V;->w()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ls1/T$c;

    .line 10
    .line 11
    return-object p0
.end method

.method protected q(Landroid/content/pm/ApplicationInfo;Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/V;->k:Ln1/C;

    .line 2
    .line 3
    invoke-virtual {v0}, Ln1/C;->j()Ln1/t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Ln1/t$a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ls1/V;->j:Lcom/android/launcher3/util/f;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/f;->j(Landroid/content/pm/ApplicationInfo;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v1, p1, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 20
    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {p2, v0, p3}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v1, v0, Landroid/graphics/drawable/AdaptiveIconDrawable;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :catch_0
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ls1/T;->q(Landroid/content/pm/ApplicationInfo;Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public v()V
    .locals 2

    .line 1
    invoke-super {p0}, Ls1/T;->v()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ls1/T;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ","

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ls1/V;->k:Ln1/C;

    .line 20
    .line 21
    invoke-virtual {v1}, Ln1/C;->k()Ln1/C$c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ln1/C$c;->g()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ls1/T;->d:Ljava/lang/String;

    .line 37
    .line 38
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lf1/a;->t:Lf1/a$a;

    .line 4
    .line 5
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object p1, Ls1/V;->l:Ljava/util/Map;

    .line 14
    .line 15
    :goto_0
    iput-object p1, p0, Ls1/V;->i:Ljava/util/Map;

    .line 16
    .line 17
    return-void
.end method
