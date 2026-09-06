.class public Lcom/android/launcher3/allapps/O$a;
.super Ljava/lang/Object;
.source "BaseAllAppsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/O;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public b:I

.field public c:I

.field public d:Lcom/android/launcher3/model/data/d;

.field public e:Lcom/android/launcher3/allapps/r0;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 10
    .line 11
    return-void
.end method

.method public static a(Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/allapps/O$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/O$a;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object p0, v0, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 8
    .line 9
    return-object v0
.end method

.method public static b(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/allapps/r0;)Lcom/android/launcher3/allapps/O$a;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/allapps/O$a;->a(Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/allapps/O$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public c()Lcom/android/launcher3/allapps/r0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/android/launcher3/allapps/O$a;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method protected e()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/O$a;->a:I

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

.method public f(Lcom/android/launcher3/allapps/O$a;)Z
    .locals 2

    .line 1
    iget v0, p1, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-ne p1, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method protected g(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r0;->a()Lcom/android/launcher3/allapps/q0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/O$a;->e:Lcom/android/launcher3/allapps/r0;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r0;->a()Lcom/android/launcher3/allapps/q0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/q0;->d(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method
