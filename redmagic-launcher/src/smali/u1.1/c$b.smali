.class public final Lu1/c$b;
.super Ls1/o$b;
.source "ThemedIconDrawable.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu1/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private final e:Landroid/graphics/Bitmap;

.field private final f:Landroid/graphics/Bitmap;

.field private final g:I

.field private final h:I


# direct methods
.method public constructor <init>(Ls1/d;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V
    .locals 1

    .line 1
    const-string v0, "bitmapInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mono"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "whiteShadowLayer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Ls1/o$b;-><init>(Ls1/d;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lu1/c$b;->e:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    iput-object p3, p0, Lu1/c$b;->f:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    iput p4, p0, Lu1/c$b;->g:I

    .line 24
    .line 25
    iput p5, p0, Lu1/c$b;->h:I

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public bridge synthetic b()Ls1/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lu1/c$b;->d()Lu1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lu1/c;
    .locals 1

    .line 1
    new-instance v0, Lu1/c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lu1/c;-><init>(Lu1/c$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final e()Ls1/d;
    .locals 1

    .line 1
    iget-object p0, p0, Ls1/o$b;->a:Ls1/d;

    .line 2
    .line 3
    const-string v0, "mBitmapInfo"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final f()I
    .locals 0

    .line 1
    iget p0, p0, Lu1/c$b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Lu1/c$b;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lu1/c$b;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lu1/c$b;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method
