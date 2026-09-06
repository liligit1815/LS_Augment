.class public Lcom/android/launcher3/util/N2;
.super Ljava/lang/Object;
.source "UserIconInfo.java"


# instance fields
.field public final a:Landroid/os/UserHandle;

.field public final b:I

.field public final c:J

.field private d:Z


# direct methods
.method public constructor <init>(Landroid/os/UserHandle;I)V
    .locals 2

    if-eqz p1, :cond_0

    .line 1
    invoke-virtual {p1}, Landroid/os/UserHandle;->hashCode()I

    move-result v0

    int-to-long v0, v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/util/N2;-><init>(Landroid/os/UserHandle;IJ)V

    return-void
.end method

.method public constructor <init>(Landroid/os/UserHandle;IJ)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/util/N2;->d:Z

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/N2;->a:Landroid/os/UserHandle;

    .line 5
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    move-result p1

    const/16 v0, 0x3e7

    if-ne p1, v0, :cond_0

    const/4 p1, 0x2

    .line 6
    iput p1, p0, Lcom/android/launcher3/util/N2;->b:I

    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/util/N2;->d:Z

    goto :goto_0

    .line 8
    :cond_0
    iput p2, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 9
    :goto_0
    iput-wide p3, p0, Lcom/android/launcher3/util/N2;->c:J

    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/util/p0;)Lcom/android/launcher3/util/p0;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->e()Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x4

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/16 v0, 0x400

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/android/launcher3/util/N2;->d:Z

    .line 22
    .line 23
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/16 v0, 0x8

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 2
    .line 3
    if-nez p0, :cond_0

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

.method public d()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/N2;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
