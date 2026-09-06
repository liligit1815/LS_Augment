.class public Ln1/G;
.super Landroid/graphics/drawable/shapes/PathShape;
.source "TriangleShape.java"


# instance fields
.field private g:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/graphics/Path;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/G;->g:Landroid/graphics/Path;

    .line 5
    .line 6
    return-void
.end method

.method public static a(FFZ)Ln1/G;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, v2, p1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 15
    .line 16
    .line 17
    div-float p2, p0, v1

    .line 18
    .line 19
    invoke-virtual {v0, p2, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 27
    .line 28
    .line 29
    div-float p2, p0, v1

    .line 30
    .line 31
    invoke-virtual {v0, p2, p1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 38
    .line 39
    .line 40
    :goto_0
    new-instance p2, Ln1/G;

    .line 41
    .line 42
    invoke-direct {p2, v0, p0, p1}, Ln1/G;-><init>(Landroid/graphics/Path;FF)V

    .line 43
    .line 44
    .line 45
    return-object p2
.end method


# virtual methods
.method public getOutline(Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/G;->g:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
