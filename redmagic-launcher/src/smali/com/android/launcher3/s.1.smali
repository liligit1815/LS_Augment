.class public Lcom/android/launcher3/s;
.super Ljava/lang/Object;
.source "AutoInstallsLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/s$d;,
        Lcom/android/launcher3/s$h;,
        Lcom/android/launcher3/s$i;,
        Lcom/android/launcher3/s$a;,
        Lcom/android/launcher3/s$b;,
        Lcom/android/launcher3/s$g;,
        Lcom/android/launcher3/s$c;,
        Lcom/android/launcher3/s$e;,
        Lcom/android/launcher3/s$f;
    }
.end annotation


# static fields
.field protected static final r:Ljava/lang/String;

.field private static s:[Ljava/lang/String;


# instance fields
.field protected final a:Landroid/content/Context;

.field protected final b:Lcom/android/launcher3/widget/l0;

.field protected final c:Lcom/android/launcher3/s$d;

.field protected final d:Landroid/content/pm/PackageManager;

.field protected final e:Lcom/android/launcher3/s$h;

.field protected final f:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/F1;

.field private final i:I

.field private final j:I

.field private final k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final l:[I

.field final m:Landroid/content/ContentValues;

.field protected final n:Ljava/lang/String;

.field protected o:Landroid/database/sqlite/SQLiteDatabase;

.field protected p:Landroid/content/res/Resources;

.field private q:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, -0x65

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/S3;->d(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/s;->r:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "com.zte.heartyservice"

    .line 10
    .line 11
    const-string v1, "com.zte.mifavor.launcher"

    .line 12
    .line 13
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/android/launcher3/s;->s:[Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Landroid/content/res/Resources;ILjava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p4}, Lcom/android/launcher3/s$h;->b(Landroid/content/res/Resources;)Lcom/android/launcher3/s$h;

    move-result-object v4

    new-instance v5, Lcom/android/launcher3/r;

    invoke-direct {v5, p4, p5}, Lcom/android/launcher3/r;-><init>(Landroid/content/res/Resources;I)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/s;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Lcom/android/launcher3/s$h;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2
    iput-object p4, v0, Lcom/android/launcher3/s;->p:Landroid/content/res/Resources;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Lcom/android/launcher3/s$h;Ljava/util/function/Supplier;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/widget/l0;",
            "Lcom/android/launcher3/s$d;",
            "Lcom/android/launcher3/s$h;",
            "Ljava/util/function/Supplier<",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 4
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/launcher3/s;->l:[I

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/s;->b:Lcom/android/launcher3/widget/l0;

    .line 7
    iput-object p3, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 9
    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 10
    iput-object p6, p0, Lcom/android/launcher3/s;->n:Ljava/lang/String;

    .line 11
    iput-object p4, p0, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 12
    iput-object p5, p0, Lcom/android/launcher3/s;->f:Ljava/util/function/Supplier;

    .line 13
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/s;->h:Lcom/android/launcher3/F1;

    .line 14
    iget p3, p2, Lcom/android/launcher3/F1;->G0:I

    iput p3, p0, Lcom/android/launcher3/s;->i:I

    .line 15
    iget p2, p2, Lcom/android/launcher3/F1;->H0:I

    iput p2, p0, Lcom/android/launcher3/s;->j:I

    .line 16
    sget-object p2, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/util/f;

    invoke-virtual {p2}, Lcom/android/launcher3/util/f;->c()Ljava/util/Map;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/s;->k:Ljava/util/Map;

    .line 17
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/s;->g:Ljava/util/Map;

    .line 18
    invoke-static {p1}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    move-result-object p1

    .line 19
    invoke-virtual {p1}, LD1/t;->p()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/os/UserHandle;

    .line 20
    invoke-virtual {p1, p3}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    move-result-object p3

    .line 21
    iget p4, p3, Lcom/android/launcher3/util/N2;->b:I

    const/4 p5, 0x1

    if-eq p4, p5, :cond_1

    if-eq p4, v0, :cond_0

    goto :goto_0

    .line 22
    :cond_0
    iget-object p4, p0, Lcom/android/launcher3/s;->g:Ljava/util/Map;

    iget-wide p5, p3, Lcom/android/launcher3/util/N2;->c:J

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    const-string p5, "cloned"

    invoke-interface {p4, p5, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 23
    :cond_1
    iget-object p4, p0, Lcom/android/launcher3/s;->g:Ljava/util/Map;

    iget-wide p5, p3, Lcom/android/launcher3/util/N2;->c:J

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    const-string p5, "work"

    invoke-interface {p4, p5, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static synthetic a(Landroid/content/res/Resources;I)Lorg/xmlpull/v1/XmlPullParser;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/s;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/s;->d(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/s;->w(Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s;->g:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "userType"

    .line 4
    .line 5
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/Long;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 18
    .line 19
    const-string v0, "profileId"

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    instance-of p1, p0, Landroid/content/res/XmlResourceParser;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    check-cast p0, Landroid/content/res/XmlResourceParser;

    .line 19
    .line 20
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->close()V

    .line 21
    .line 22
    .line 23
    :cond_1
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 24
    .line 25
    const-string p1, "No start tag found"

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0

    .line 31
    :cond_2
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    instance-of v0, p0, Landroid/content/res/XmlResourceParser;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    move-object v0, p0

    .line 46
    check-cast v0, Landroid/content/res/XmlResourceParser;

    .line 47
    .line 48
    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    .line 49
    .line 50
    .line 51
    :cond_3
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v2, "Unexpected start tag: found "

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p0, ", expected "

    .line 71
    .line 72
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-direct {v0, p0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw v0

    .line 86
    :cond_4
    return-void
.end method

.method private static h(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    add-int/2addr p1, v0

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    return-object p0
.end method

.method static i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static k(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;)Lcom/android/launcher3/s;
    .locals 15

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.autoinstalls.config.action.PLAY_AUTO_INSTALL"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/android/launcher3/util/N1;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Lcom/android/launcher3/util/N1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 20
    .line 21
    iget v4, v2, Lcom/android/launcher3/F1;->H0:I

    .line 22
    .line 23
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget v5, v2, Lcom/android/launcher3/F1;->G0:I

    .line 28
    .line 29
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    iget v6, v2, Lcom/android/launcher3/F1;->e1:I

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "default_layout_%dx%d_h%s"

    .line 44
    .line 45
    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v0, v4}, Lcom/android/launcher3/util/N1;->f(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    const-string v6, "Formatted layout: "

    .line 54
    .line 55
    const-string v7, "AutoInstalls"

    .line 56
    .line 57
    if-nez v5, :cond_1

    .line 58
    .line 59
    new-instance v5, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v4, " not found. Trying layout without hosteat"

    .line 71
    .line 72
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-static {v7, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    iget v4, v2, Lcom/android/launcher3/F1;->H0:I

    .line 83
    .line 84
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    .line 89
    .line 90
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    filled-new-array {v4, v2}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    const-string v4, "default_layout_%dx%d"

    .line 99
    .line 100
    invoke-static {v3, v4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v0, v4}, Lcom/android/launcher3/util/N1;->f(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    :cond_1
    if-nez v5, :cond_2

    .line 109
    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v3, " not found. Trying the default layout"

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    const-string v2, "default_layout"

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/N1;->f(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    invoke-static {}, Lx1/O;->I1()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_2

    .line 144
    .line 145
    return-object v1

    .line 146
    :cond_2
    move v13, v5

    .line 147
    if-nez v13, :cond_3

    .line 148
    .line 149
    new-instance p0, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v2, "Layout definition not found in package: "

    .line 155
    .line 156
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/android/launcher3/util/N1;->d()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {v7, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    return-object v1

    .line 174
    :cond_3
    new-instance v8, Lcom/android/launcher3/s;

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/android/launcher3/util/N1;->e()Landroid/content/res/Resources;

    .line 177
    .line 178
    .line 179
    move-result-object v12

    .line 180
    const-string v14, "workspace"

    .line 181
    .line 182
    move-object v9, p0

    .line 183
    move-object/from16 v10, p1

    .line 184
    .line 185
    move-object/from16 v11, p2

    .line 186
    .line 187
    invoke-direct/range {v8 .. v14}, Lcom/android/launcher3/s;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/s$d;Landroid/content/res/Resources;ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-object v8
.end method

.method protected static l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "http://schemas.android.com/apk/res-auto/com.zte.mifavor.launcher"

    .line 6
    .line 7
    invoke-interface {p0, v0, p1, p2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, v0, p1, p2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    return v0
.end method

.method protected static m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "http://schemas.android.com/apk/res-auto/com.zte.mifavor.launcher"

    .line 2
    .line 3
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    return-object v0
.end method

.method private w(Ljava/lang/Object;I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "CloudFolder-"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 33
    .line 34
    .line 35
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method protected e(Ljava/lang/String;Landroid/content/Intent;I)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/s$d;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p2, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const-string v4, "intent"

    .line 15
    .line 16
    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 20
    .line 21
    const-string v3, "title"

    .line 22
    .line 23
    invoke-virtual {v1, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 27
    .line 28
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v3, "itemType"

    .line 33
    .line 34
    invoke-virtual {p1, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v3, "spanX"

    .line 45
    .line 46
    invoke-virtual {p1, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 50
    .line 51
    const-string v3, "spanY"

    .line 52
    .line 53
    invoke-virtual {p1, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 57
    .line 58
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v3, "_id"

    .line 63
    .line 64
    invoke-virtual {p1, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    if-nez p3, :cond_0

    .line 74
    .line 75
    iget-object p2, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 76
    .line 77
    const-string p3, "profileId"

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-nez p2, :cond_0

    .line 84
    .line 85
    iget-object p2, p0, Lcom/android/launcher3/s;->k:Ljava/util/Map;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 96
    .line 97
    if-eqz p1, :cond_0

    .line 98
    .line 99
    iget-object p2, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 100
    .line 101
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, LD1/t;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v1, v3}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v5

    .line 119
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p2, p3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 127
    .line 128
    invoke-static {p1}, Lcom/android/launcher3/model/data/d;->R(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/Intent;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p2, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 140
    .line 141
    iget-object p2, p0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 144
    .line 145
    invoke-interface {p1, p2, p0}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-gez p0, :cond_1

    .line 150
    .line 151
    const/4 p0, -0x1

    .line 152
    return p0

    .line 153
    :cond_1
    return v0
.end method

.method protected f(Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/s$d;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p2, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-string v3, "intent"

    .line 15
    .line 16
    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 20
    .line 21
    const-string v2, "title"

    .line 22
    .line 23
    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 27
    .line 28
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    const-string v1, "itemType"

    .line 33
    .line 34
    invoke-virtual {p1, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 38
    .line 39
    const-string p3, "spanX"

    .line 40
    .line 41
    invoke-virtual {p1, p3, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 45
    .line 46
    const-string p3, "spanY"

    .line 47
    .line 48
    invoke-virtual {p1, p3, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    const-string p4, "_id"

    .line 58
    .line 59
    invoke-virtual {p1, p4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Lx1/O;->g2(Landroid/content/Intent;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 69
    .line 70
    const/16 p2, 0x100

    .line 71
    .line 72
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string p3, "options"

    .line 77
    .line 78
    invoke-virtual {p1, p3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 82
    .line 83
    const/4 p2, 0x1

    .line 84
    invoke-static {p1, p2}, Lx1/O;->q5(Landroid/content/Context;Z)V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 88
    .line 89
    iget-object p2, p0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 92
    .line 93
    invoke-interface {p1, p2, p0}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-gez p0, :cond_1

    .line 98
    .line 99
    const/4 p0, -0x1

    .line 100
    return p0

    .line 101
    :cond_1
    return v0
.end method

.method protected j(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->n1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/launcher3/s;->s:[Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "deleteCTAItem: "

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "AutoInstalls"

    .line 37
    .line 38
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

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
    new-instance v1, Lcom/android/launcher3/s$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$a;-><init>(Lcom/android/launcher3/s;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "appicon"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/s$b;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$b;-><init>(Lcom/android/launcher3/s;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "autoinstall"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/s$g;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$g;-><init>(Lcom/android/launcher3/s;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "shortcut"

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
    new-instance v1, Lcom/android/launcher3/s$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$a;-><init>(Lcom/android/launcher3/s;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "appicon"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/android/launcher3/s$b;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$b;-><init>(Lcom/android/launcher3/s;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "autoinstall"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/s$c;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$c;-><init>(Lcom/android/launcher3/s;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "folder"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/s$e;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$e;-><init>(Lcom/android/launcher3/s;)V

    .line 39
    .line 40
    .line 41
    const-string v2, "appwidget"

    .line 42
    .line 43
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/android/launcher3/s$f;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$f;-><init>(Lcom/android/launcher3/s;)V

    .line 49
    .line 50
    .line 51
    const-string v2, "searchwidget"

    .line 52
    .line 53
    invoke-virtual {v0, v2, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/android/launcher3/s$g;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lcom/android/launcher3/s$g;-><init>(Lcom/android/launcher3/s;)V

    .line 59
    .line 60
    .line 61
    const-string p0, "shortcut"

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public p(Landroid/database/sqlite/SQLiteDatabase;)I
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    :try_start_0
    iget-object p1, p0, Lcom/android/launcher3/s;->q:Ljava/io/InputStream;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s;->t(Ljava/io/InputStream;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/s;->f:Ljava/util/function/Supplier;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lorg/xmlpull/v1/XmlPullParser;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s;->u(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 21
    .line 22
    .line 23
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    return p0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string p1, "AutoInstalls"

    .line 27
    .line 28
    const-string v0, "Error parsing layout: "

    .line 29
    .line 30
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method protected q(Landroid/content/res/XmlResourceParser;Landroid/util/ArrayMap;)I
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/XmlResourceParser;",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/content/ContentValues;->clear()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Lcom/android/launcher3/util/x0;

    .line 11
    .line 12
    invoke-direct {v2}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v3, v0, Lcom/android/launcher3/s;->l:[I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3}, Lcom/android/launcher3/s;->s(Lorg/xmlpull/v1/XmlPullParser;[I)V

    .line 18
    .line 19
    .line 20
    iget-object v3, v0, Lcom/android/launcher3/s;->l:[I

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    aget v5, v3, v4

    .line 24
    .line 25
    const/4 v6, 0x1

    .line 26
    aget v3, v3, v6

    .line 27
    .line 28
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 29
    .line 30
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    const-string v9, "container"

    .line 35
    .line 36
    invoke-virtual {v7, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 37
    .line 38
    .line 39
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 40
    .line 41
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    const-string v10, "screen"

    .line 46
    .line 47
    invoke-virtual {v7, v10, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 48
    .line 49
    .line 50
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 51
    .line 52
    const-string v8, "x"

    .line 53
    .line 54
    invoke-static {v1, v8}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    iget v11, v0, Lcom/android/launcher3/s;->j:I

    .line 59
    .line 60
    invoke-static {v8, v11}, Lcom/android/launcher3/s;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string v11, "cellX"

    .line 65
    .line 66
    invoke-virtual {v7, v11, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 70
    .line 71
    const-string v8, "y"

    .line 72
    .line 73
    invoke-static {v1, v8}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    iget v12, v0, Lcom/android/launcher3/s;->i:I

    .line 78
    .line 79
    invoke-static {v8, v12}, Lcom/android/launcher3/s;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    const-string v12, "cellY"

    .line 84
    .line 85
    invoke-virtual {v7, v12, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    move-object/from16 v8, p2

    .line 93
    .line 94
    invoke-virtual {v8, v7}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    check-cast v7, Lcom/android/launcher3/s$i;

    .line 99
    .line 100
    const-string v8, "AutoInstalls"

    .line 101
    .line 102
    if-nez v7, :cond_0

    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v2, "Ignoring unknown element tag: "

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    return v4

    .line 129
    :cond_0
    invoke-interface {v7, v1}, Lcom/android/launcher3/s$i;->a(Landroid/content/res/XmlResourceParser;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    const/16 v13, -0x64

    .line 134
    .line 135
    if-ltz v1, :cond_2

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_1

    .line 142
    .line 143
    if-ne v5, v13, :cond_1

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 146
    .line 147
    .line 148
    :cond_1
    return v6

    .line 149
    :cond_2
    const/4 v6, -0x2

    .line 150
    if-ne v1, v6, :cond_4

    .line 151
    .line 152
    instance-of v1, v7, Lcom/android/launcher3/s$e;

    .line 153
    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_3

    .line 161
    .line 162
    if-ne v5, v13, :cond_3

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 165
    .line 166
    .line 167
    :cond_3
    new-instance v14, Lcom/android/launcher3/H5$a;

    .line 168
    .line 169
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 170
    .line 171
    invoke-virtual {v1, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result v15

    .line 179
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 180
    .line 181
    invoke-virtual {v1, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v16

    .line 189
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 190
    .line 191
    invoke-virtual {v1, v10}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 196
    .line 197
    .line 198
    move-result v17

    .line 199
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 200
    .line 201
    invoke-virtual {v1, v9}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    int-to-long v1, v1

    .line 210
    iget-object v3, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 211
    .line 212
    const-string v5, "spanX"

    .line 213
    .line 214
    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 219
    .line 220
    .line 221
    move-result v20

    .line 222
    iget-object v3, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 223
    .line 224
    const-string v5, "spanY"

    .line 225
    .line 226
    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 231
    .line 232
    .line 233
    move-result v21

    .line 234
    iget-object v3, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 235
    .line 236
    const-string v5, "itemType"

    .line 237
    .line 238
    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 243
    .line 244
    .line 245
    move-result v22

    .line 246
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 247
    .line 248
    .line 249
    move-result-object v23

    .line 250
    iget-object v3, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 251
    .line 252
    const-string v5, "appWidgetProvider"

    .line 253
    .line 254
    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 259
    .line 260
    .line 261
    move-result-object v24

    .line 262
    iget-object v3, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 263
    .line 264
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 265
    .line 266
    .line 267
    move-result-object v25

    .line 268
    move-wide/from16 v18, v1

    .line 269
    .line 270
    invoke-direct/range {v14 .. v25}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 271
    .line 272
    .line 273
    iget-object v1, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 274
    .line 275
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v1, v14}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V

    .line 284
    .line 285
    .line 286
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 287
    .line 288
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    const-string v3, "appWidgetId"

    .line 293
    .line 294
    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 295
    .line 296
    .line 297
    iget-object v1, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 298
    .line 299
    iget-object v2, v0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 300
    .line 301
    invoke-interface {v2}, Lcom/android/launcher3/s$d;->c()I

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    const-string v3, "_id"

    .line 310
    .line 311
    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 312
    .line 313
    .line 314
    iget-object v1, v0, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 315
    .line 316
    iget-object v2, v0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 317
    .line 318
    iget-object v0, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 319
    .line 320
    invoke-interface {v1, v2, v0}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .line 328
    .line 329
    const-string v2, "parseAndAddNode  insertedId:"

    .line 330
    .line 331
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-static {v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    .line 343
    .line 344
    :cond_4
    return v4
.end method

.method protected r(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/ArrayMap;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "include"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string p2, "workspace"

    .line 15
    .line 16
    invoke-static {p1, p2, v1}, Lcom/android/launcher3/s;->l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 23
    .line 24
    invoke-interface {p2, p1}, Lcom/android/launcher3/s$h;->a(I)Landroid/content/res/XmlResourceParser;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s;->u(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    return v1

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/ContentValues;->clear()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/s;->l:[I

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/s;->s(Lorg/xmlpull/v1/XmlPullParser;[I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/s;->l:[I

    .line 45
    .line 46
    aget v2, v0, v1

    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    aget v0, v0, v3

    .line 50
    .line 51
    iget-object v4, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v5, "container"

    .line 58
    .line 59
    invoke-virtual {v4, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v4, "screen"

    .line 69
    .line 70
    invoke-virtual {v2, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 74
    .line 75
    const-string v2, "x"

    .line 76
    .line 77
    invoke-static {p1, v2}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget v4, p0, Lcom/android/launcher3/s;->j:I

    .line 82
    .line 83
    invoke-static {v2, v4}, Lcom/android/launcher3/s;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v4, "cellX"

    .line 88
    .line 89
    invoke-virtual {v0, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 93
    .line 94
    const-string v2, "y"

    .line 95
    .line 96
    invoke-static {p1, v2}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget p0, p0, Lcom/android/launcher3/s;->i:I

    .line 101
    .line 102
    invoke-static {v2, p0}, Lcom/android/launcher3/s;->h(Ljava/lang/String;I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string v2, "cellY"

    .line 107
    .line 108
    invoke-virtual {v0, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p2, p0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Lcom/android/launcher3/s$i;

    .line 120
    .line 121
    if-nez p0, :cond_2

    .line 122
    .line 123
    new-instance p0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string p2, "Ignoring unknown element tag: "

    .line 129
    .line 130
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "AutoInstalls"

    .line 145
    .line 146
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    return v1

    .line 150
    :cond_2
    invoke-interface {p0, p1}, Lcom/android/launcher3/s$i;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-ltz p0, :cond_3

    .line 155
    .line 156
    return v3

    .line 157
    :cond_3
    return v1
.end method

.method protected s(Lorg/xmlpull/v1/XmlPullParser;[I)V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/s;->r:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "container"

    .line 4
    .line 5
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v2, -0x65

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    aput v2, p2, v3

    .line 20
    .line 21
    const-string v0, "rank"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 32
    .line 33
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/s;->h:Lcom/android/launcher3/F1;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/F1;->r0()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-ge p1, p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 49
    .line 50
    :cond_1
    :goto_0
    aput p1, p2, v4

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    const/16 v0, -0x64

    .line 54
    .line 55
    aput v0, p2, v3

    .line 56
    .line 57
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    aput v0, p2, v3

    .line 68
    .line 69
    :cond_3
    aget v0, p2, v3

    .line 70
    .line 71
    const-string v1, "screen"

    .line 72
    .line 73
    if-ne v2, v0, :cond_6

    .line 74
    .line 75
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 84
    .line 85
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_5

    .line 90
    .line 91
    iget-object p0, p0, Lcom/android/launcher3/s;->h:Lcom/android/launcher3/F1;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/F1;->r0()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-ge p1, p0, :cond_4

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    add-int/lit8 p1, p1, 0x1

    .line 101
    .line 102
    :cond_5
    :goto_1
    aput p1, p2, v4

    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    aput p0, p2, v4

    .line 114
    .line 115
    return-void
.end method

.method public t(Ljava/io/InputStream;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "UTF-8"

    .line 6
    .line 7
    invoke-interface {v0, p1, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/s;->n:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/android/launcher3/s;->g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/s;->o()Landroid/util/ArrayMap;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    :goto_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x3

    .line 29
    if-ne v3, v4, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-le v4, p1, :cond_2

    .line 36
    .line 37
    :cond_0
    const/4 v4, 0x1

    .line 38
    if-eq v3, v4, :cond_2

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    if-eq v3, v4, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/s;->r(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/ArrayMap;)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    add-int/2addr v2, v3

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return v2
.end method

.method protected u(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/s;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->g(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/s;->o()Landroid/util/ArrayMap;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x3

    .line 20
    if-ne v3, v4, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-le v4, v0, :cond_3

    .line 27
    .line 28
    :cond_0
    const/4 v4, 0x1

    .line 29
    if-eq v3, v4, :cond_3

    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    if-eq v3, v4, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    instance-of v3, p1, Landroid/content/res/XmlResourceParser;

    .line 36
    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    move-object v3, p1

    .line 40
    check-cast v3, Landroid/content/res/XmlResourceParser;

    .line 41
    .line 42
    invoke-virtual {p0, v3, v1}, Lcom/android/launcher3/s;->q(Landroid/content/res/XmlResourceParser;Landroid/util/ArrayMap;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    :goto_1
    add-int/2addr v2, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/s;->r(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/ArrayMap;)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    return v2
.end method

.method public v(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s;->q:Ljava/io/InputStream;

    .line 2
    .line 3
    return-void
.end method
