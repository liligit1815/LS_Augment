.class Lcom/zte/mifavor/widget/RippleDrawableZTE$c;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "RippleDrawableZTE.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/RippleDrawableZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field private a:Landroid/graphics/drawable/Drawable$ConstantState;

.field private b:Landroid/content/res/ColorStateList;

.field private c:I


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p1, p2, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b:Landroid/content/res/ColorStateList;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b:Landroid/content/res/ColorStateList;

    .line 9
    .line 10
    iget p1, p2, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c:I

    .line 11
    .line 12
    iput p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c:I

    .line 13
    .line 14
    :cond_0
    iput-object p3, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 15
    .line 16
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->getChangingConfigurations()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/RippleDrawableZTE;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->h(Lcom/zte/mifavor/widget/RippleDrawableZTE;Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
