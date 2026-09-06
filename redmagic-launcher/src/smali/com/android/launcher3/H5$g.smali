.class public Lcom/android/launcher3/H5$g;
.super Ljava/lang/Object;
.source "ResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/H5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/H5$g;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/android/launcher3/H5$g;->e:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/android/launcher3/H5$g;->f:I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/H5$g;->g:Z

    .line 14
    .line 15
    iput-object p2, p0, Lcom/android/launcher3/H5$g;->a:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/android/launcher3/H5$g;->b:Ljava/lang/String;

    .line 18
    .line 19
    iput p4, p0, Lcom/android/launcher3/H5$g;->d:I

    .line 20
    .line 21
    const/high16 p2, -0x1000000

    .line 22
    .line 23
    if-ne p5, p2, :cond_0

    .line 24
    .line 25
    const p2, 0x7f1501aa

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const p2, 0x7f1501a5

    .line 30
    .line 31
    .line 32
    :goto_0
    const p3, 0x7f040781

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p3, p2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lcom/android/launcher3/H5$g;->c:I

    .line 40
    .line 41
    iput p6, p0, Lcom/android/launcher3/H5$g;->e:I

    .line 42
    .line 43
    iput p1, p0, Lcom/android/launcher3/H5$g;->f:I

    .line 44
    .line 45
    iput-boolean p7, p0, Lcom/android/launcher3/H5$g;->g:Z

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$g;->c:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, -0x1

    .line 7
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$g;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/H5$g;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$g;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/H5$g;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/H5$g;->e:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, -0x1

    .line 7
    return p0
.end method
