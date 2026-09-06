.class Landroidx/appcompat/widget/C$a;
.super LA/h$f;
.source "AppCompatTextHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/widget/C;->C(Landroid/content/Context;Landroidx/appcompat/widget/a0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Ljava/lang/ref/WeakReference;

.field final synthetic d:Landroidx/appcompat/widget/C;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/C;IILjava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/C$a;->d:Landroidx/appcompat/widget/C;

    .line 2
    .line 3
    iput p2, p0, Landroidx/appcompat/widget/C$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/appcompat/widget/C$a;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/appcompat/widget/C$a;->c:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {p0}, LA/h$f;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public f(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroid/graphics/Typeface;)V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/C$a;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget v1, p0, Landroidx/appcompat/widget/C$a;->b:I

    .line 7
    .line 8
    and-int/lit8 v1, v1, 0x2

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-static {p1, v0, v1}, Landroidx/appcompat/widget/C$f;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/C$a;->d:Landroidx/appcompat/widget/C;

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/appcompat/widget/C$a;->c:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1}, Landroidx/appcompat/widget/C;->n(Ljava/lang/ref/WeakReference;Landroid/graphics/Typeface;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
