.class public LI3/d;
.super Ljava/lang/Object;

# interfaces
.implements LI3/c;


# instance fields
.field private final a:Z

.field private b:Landroid/os/Vibrator;

.field private c:Landroid/content/Context;

.field private d:Ljava/lang/Class;

.field private e:Landroid/os/Handler;

.field private f:Landroid/os/HandlerThread;

.field private g:LI3/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LI3/d;->a:Z

    .line 6
    .line 7
    new-instance v0, LI3/a;

    .line 8
    .line 9
    invoke-direct {v0}, LI3/a;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LI3/d;->g:LI3/a;

    .line 13
    .line 14
    iput-object p1, p0, LI3/d;->c:Landroid/content/Context;

    .line 15
    .line 16
    const-string v0, "vibrator"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/os/Vibrator;

    .line 23
    .line 24
    iput-object p1, p0, LI3/d;->b:Landroid/os/Vibrator;

    .line 25
    .line 26
    :try_start_0
    const-string p1, "android.os.RichTapVibrationEffect"

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, LI3/d;->d:Ljava/lang/Class;

    .line 33
    .line 34
    invoke-direct {p0}, LI3/d;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static c()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "android.os.RichTapVibrationEffect"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "checkIfRichTapSupport"

    .line 9
    .line 10
    new-array v3, v0, [Ljava/lang/Class;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-array v2, v0, [Ljava/lang/Object;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    const/4 v2, 0x2

    .line 30
    if-ne v2, v1, :cond_0

    .line 31
    .line 32
    return v0

    .line 33
    :cond_0
    const/4 v0, 0x1

    .line 34
    return v0

    .line 35
    :catch_0
    move-exception v1

    .line 36
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    return v0
.end method

.method private d()V
    .locals 5

    .line 1
    :try_start_0
    iget-object p0, p0, LI3/d;->d:Ljava/lang/Class;

    .line 2
    .line 3
    const-string v0, "checkIfRichTapSupport"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ljava/lang/Class;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-array v0, v1, [Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p0, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v0, 0x1

    .line 26
    if-ne v0, p0, :cond_0

    .line 27
    .line 28
    invoke-static {v0}, LH3/f;->b(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/high16 v0, 0xff0000

    .line 33
    .line 34
    and-int/2addr v0, p0

    .line 35
    shr-int/lit8 v0, v0, 0x10

    .line 36
    .line 37
    const v2, 0xff00

    .line 38
    .line 39
    .line 40
    and-int/2addr v2, p0

    .line 41
    shr-int/lit8 v2, v2, 0x8

    .line 42
    .line 43
    and-int/lit16 p0, p0, 0xff

    .line 44
    .line 45
    invoke-static {v2}, LH3/f;->a(I)I

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, LH3/f;->c(I)I

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, LH3/f;->b(Z)V

    .line 52
    .line 53
    .line 54
    const-string v1, "RichtapPlayer"

    .line 55
    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v4, "clientCode:"

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, " majorVersion:"

    .line 70
    .line 71
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v0, " minorVersion:"

    .line 78
    .line 79
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catch_0
    move-exception p0

    .line 94
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private e()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/d;->f:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LI3/d;->f:Landroid/os/HandlerThread;

    .line 10
    .line 11
    iput-object v0, p0, LI3/d;->e:Landroid/os/Handler;

    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/d;->g:LI3/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LI3/a;->a()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, LI3/d;->e()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, LI3/d;->c:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {p0}, LH3/d;->b(Landroid/content/Context;)LH3/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, LH3/d;->c()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, LI3/d;->g:LI3/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LI3/a;->a()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, LI3/d;->e()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
