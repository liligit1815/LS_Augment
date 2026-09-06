.class public Ls1/m0;
.super Ljava/lang/Object;
.source "ShadowGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/m0$a;
    }
.end annotation


# instance fields
.field private final a:I

.field private final b:Landroid/graphics/Paint;

.field private final c:Landroid/graphics/Paint;

.field private final d:Landroid/graphics/BlurMaskFilter;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ls1/m0;->a:I

    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ls1/m0;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ls1/m0;->c:Landroid/graphics/Paint;

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/BlurMaskFilter;

    .line 22
    .line 23
    int-to-float p1, p1

    .line 24
    const v1, 0x3d0f5c29    # 0.035f

    .line 25
    .line 26
    .line 27
    mul-float/2addr p1, v1

    .line 28
    sget-object v1, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    .line 29
    .line 30
    invoke-direct {v0, p1, v1}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ls1/m0;->d:Landroid/graphics/BlurMaskFilter;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method a(Landroid/graphics/Path;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized b(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method
