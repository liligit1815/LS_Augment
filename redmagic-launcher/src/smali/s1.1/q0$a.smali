.class Ls1/q0$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "UserBadgeDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/q0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/graphics/drawable/Drawable$ConstantState;

.field private final b:I

.field private final c:I

.field private final d:Z


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable$ConstantState;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/q0$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 5
    .line 6
    iput p2, p0, Ls1/q0$a;->b:I

    .line 7
    .line 8
    iput p3, p0, Ls1/q0$a;->c:I

    .line 9
    .line 10
    iput-boolean p4, p0, Ls1/q0$a;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/q0$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->getChangingConfigurations()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 1
    new-instance v0, Ls1/q0;

    iget-object v1, p0, Ls1/q0$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v2, p0, Ls1/q0$a;->b:I

    iget v3, p0, Ls1/q0$a;->c:I

    iget-boolean v4, p0, Ls1/q0$a;->d:Z

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ls1/q0;-><init>(Landroid/graphics/drawable/Drawable;IIZLs1/r0;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 3
    new-instance v0, Ls1/q0;

    iget-object v1, p0, Ls1/q0$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 4
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v2, p0, Ls1/q0$a;->b:I

    iget v3, p0, Ls1/q0$a;->c:I

    iget-boolean v4, p0, Ls1/q0$a;->d:Z

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ls1/q0;-><init>(Landroid/graphics/drawable/Drawable;IIZLs1/r0;)V

    return-object v0
.end method

.method public newDrawable(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 5
    new-instance v0, Ls1/q0;

    iget-object v1, p0, Ls1/q0$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 6
    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v2, p0, Ls1/q0$a;->b:I

    iget v3, p0, Ls1/q0$a;->c:I

    iget-boolean v4, p0, Ls1/q0$a;->d:Z

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ls1/q0;-><init>(Landroid/graphics/drawable/Drawable;IIZLs1/r0;)V

    return-object v0
.end method
