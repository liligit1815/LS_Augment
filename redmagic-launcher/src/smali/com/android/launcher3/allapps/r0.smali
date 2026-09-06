.class public Lcom/android/launcher3/allapps/r0;
.super Ljava/lang/Object;
.source "SectionDecorationInfo.java"


# instance fields
.field protected a:Z

.field private b:Lcom/android/launcher3/allapps/q0;

.field protected c:Z

.field protected d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/allapps/q0;

    .line 5
    .line 6
    const/4 v7, 0x2

    .line 7
    invoke-direct {p0, p2, v7}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v8, 0x4

    .line 12
    invoke-direct {p0, p2, v8}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    const/16 v9, 0x8

    .line 17
    .line 18
    invoke-direct {p0, p2, v9}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    const/16 v10, 0x10

    .line 23
    .line 24
    invoke-direct {p0, p2, v10}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    const/16 v2, 0xff

    .line 29
    .line 30
    move-object v1, p1

    .line 31
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/allapps/q0;-><init>(Landroid/content/Context;IZZZZ)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/allapps/r0;->b:Lcom/android/launcher3/allapps/q0;

    .line 35
    .line 36
    iput-boolean p3, p0, Lcom/android/launcher3/allapps/r0;->a:Z

    .line 37
    .line 38
    invoke-direct {p0, p2, v7}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 p3, 0x0

    .line 43
    const/4 v0, 0x1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    invoke-direct {p0, p2, v8}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    move p1, v0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move p1, p3

    .line 55
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/r0;->c:Z

    .line 56
    .line 57
    invoke-direct {p0, p2, v9}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-direct {p0, p2, v10}, Lcom/android/launcher3/allapps/r0;->b(II)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    move p3, v0

    .line 70
    :cond_1
    iput-boolean p3, p0, Lcom/android/launcher3/allapps/r0;->d:Z

    .line 71
    .line 72
    return-void
.end method

.method private b(II)Z
    .locals 0

    .line 1
    and-int p0, p1, p2

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public a()Lcom/android/launcher3/allapps/q0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/r0;->b:Lcom/android/launcher3/allapps/q0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/r0;->a:Z

    .line 2
    .line 3
    return p0
.end method
