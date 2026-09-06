.class abstract Landroidx/vectordrawable/graphics/drawable/f$f;
.super Landroidx/vectordrawable/graphics/drawable/f$e;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/vectordrawable/graphics/drawable/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "f"
.end annotation


# instance fields
.field protected a:[LB/c$b;

.field b:Ljava/lang/String;

.field c:I

.field d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Landroidx/vectordrawable/graphics/drawable/f$e;-><init>(Landroidx/vectordrawable/graphics/drawable/f$a;)V

    .line 2
    iput-object v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->c:I

    return-void
.end method

.method public constructor <init>(Landroidx/vectordrawable/graphics/drawable/f$f;)V
    .locals 1

    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Landroidx/vectordrawable/graphics/drawable/f$e;-><init>(Landroidx/vectordrawable/graphics/drawable/f$a;)V

    .line 5
    iput-object v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->c:I

    .line 7
    iget-object v0, p1, Landroidx/vectordrawable/graphics/drawable/f$f;->b:Ljava/lang/String;

    iput-object v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->b:Ljava/lang/String;

    .line 8
    iget v0, p1, Landroidx/vectordrawable/graphics/drawable/f$f;->d:I

    iput v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->d:I

    .line 9
    iget-object p1, p1, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    invoke-static {p1}, LB/c;->f([LB/c$b;)[LB/c$b;

    move-result-object p1

    iput-object p1, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    return-void
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, p1}, LB/c$b;->h([LB/c$b;Landroid/graphics/Path;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public getPathData()[LB/c$b;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPathName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPathData([LB/c$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    .line 2
    .line 3
    invoke-static {v0, p1}, LB/c;->b([LB/c$b;[LB/c$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, LB/c;->f([LB/c$b;)[LB/c$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Landroidx/vectordrawable/graphics/drawable/f$f;->a:[LB/c$b;

    .line 17
    .line 18
    invoke-static {p0, p1}, LB/c;->k([LB/c$b;[LB/c$b;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
