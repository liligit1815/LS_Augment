.class public LQ1/f;
.super Ljava/lang/Object;
.source "StateAnimationConfig.java"


# instance fields
.field public g:J

.field public h:I

.field public i:I

.field protected final j:[Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LQ1/f;->h:I

    .line 6
    .line 7
    iput v0, p0, LQ1/f;->i:I

    .line 8
    .line 9
    const/16 v0, 0x15

    .line 10
    .line 11
    new-array v0, v0, [Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    iput-object v0, p0, LQ1/f;->j:[Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(LQ1/f;)V
    .locals 3

    .line 1
    iget-wide v0, p0, LQ1/f;->g:J

    .line 2
    .line 3
    iput-wide v0, p1, LQ1/f;->g:J

    .line 4
    .line 5
    iget v0, p0, LQ1/f;->i:I

    .line 6
    .line 7
    iput v0, p1, LQ1/f;->i:I

    .line 8
    .line 9
    iget v0, p0, LQ1/f;->h:I

    .line 10
    .line 11
    iput v0, p1, LQ1/f;->h:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    const/16 v1, 0x15

    .line 15
    .line 16
    if-ge v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p1, LQ1/f;->j:[Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    iget-object v2, p0, LQ1/f;->j:[Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    aget-object v2, v2, v0

    .line 23
    .line 24
    aput-object v2, v1, v0

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, LQ1/f;->j:[Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    return-object p0
.end method

.method public c(I)Z
    .locals 0

    .line 1
    iget p0, p0, LQ1/f;->i:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

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

.method public d()Z
    .locals 1

    .line 1
    iget p0, p0, LQ1/f;->h:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public e(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, LQ1/f;->j:[Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    aput-object p2, p0, p1

    .line 4
    .line 5
    return-void
.end method
