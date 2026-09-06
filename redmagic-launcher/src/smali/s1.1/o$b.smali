.class public Ls1/o$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "FastBitmapDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field protected final a:Ls1/d;

.field protected b:Z

.field private c:Landroid/graphics/drawable/Drawable$ConstantState;

.field d:I


# direct methods
.method public constructor <init>(Ls1/d;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ls1/o$b;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Ls1/o$b;->a:Ls1/d;

    .line 8
    .line 9
    return-void
.end method

.method static bridge synthetic a(Ls1/o$b;Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/o$b;->c:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method protected b()Ls1/o;
    .locals 1

    .line 1
    new-instance v0, Ls1/o;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/o$b;->a:Ls1/d;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ls1/o;-><init>(Ls1/d;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final c()Ls1/o;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ls1/o$b;->b()Ls1/o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Ls1/o$b;->b:Z

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ls1/o;->s(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ls1/o$b;->c:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ls1/o;->o(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget p0, p0, Ls1/o$b;->d:I

    .line 22
    .line 23
    iput p0, v0, Ls1/o;->n:I

    .line 24
    .line 25
    return-object v0
.end method

.method public getChangingConfigurations()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/o$b;->c()Ls1/o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
