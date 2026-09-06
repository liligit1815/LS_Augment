.class public Lcom/android/launcher3/BubbleTextView;
.super Landroid/widget/TextView;
.source "BubbleTextView.java"

# interfaces
.implements Ls1/P$a;
.implements Lcom/android/launcher3/views/H;
.implements Lcom/android/launcher3/dragndrop/y;
.implements Lcom/android/launcher3/G5;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/BubbleTextView$f;
    }
.end annotation


# static fields
.field private static final r0:Ljava/lang/Character;

.field private static final s0:LI1/e$b;

.field private static final t0:[I

.field private static final u0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/BubbleTextView;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static final v0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/BubbleTextView;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final w0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/BubbleTextView;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final x0:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/BubbleTextView;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile y0:Z


# instance fields
.field private A:Lk1/a;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private B:Ls1/m;

.field protected C:Ls1/m$a;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
        deepExport = true
    .end annotation
.end field

.field private D:Landroid/animation/Animator;

.field private E:Z

.field private final F:I

.field private final G:I

.field private final H:I

.field private final I:Landroid/graphics/Paint;

.field private final J:Landroid/graphics/Rect;

.field private K:Lcom/android/launcher3/BubbleTextView$f;

.field private final L:I

.field private final M:I

.field private N:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private O:F
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private P:I

.field private Q:Landroid/animation/Animator;

.field private final R:Ljava/lang/String;

.field private final S:Ljava/lang/String;

.field private T:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private U:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field protected V:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private W:Lcom/android/launcher3/util/w;

.field private a0:Z

.field private b0:Z

.field private c0:Z

.field public d0:Z

.field private e0:Z

.field private f0:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private g:F

.field private g0:Ljava/lang/Runnable;

.field private h:Lcom/android/launcher3/util/x0;

.field private h0:Z

.field private i:Ljava/lang/CharSequence;

.field private i0:Lcom/android/launcher3/iconarrange/a;

.field private j:Ljava/lang/CharSequence;

.field private j0:Landroid/graphics/drawable/Drawable;

.field private final k:Lcom/android/launcher3/util/z1;

.field private k0:Ljava/lang/String;

.field protected final l:Lcom/android/launcher3/views/k;

.field private l0:Lx1/v;

.field private m:Ls1/o;

.field private m0:I

.field private n:Lcom/android/launcher3/h0;

.field private n0:Landroid/animation/ValueAnimator;

.field private o:Z

.field private o0:Z

.field protected p:I

.field private p0:Z

.field private final q:Lcom/android/launcher3/V;

.field private q0:Z

.field private r:Z

.field private final s:Z

.field protected t:I

.field private u:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private v:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field protected w:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private x:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private y:Landroid/content/res/ColorStateList;
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private z:F
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->r0:Ljava/lang/Character;

    .line 8
    .line 9
    invoke-static {}, LI1/e$b;->a()LI1/e$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->s0:LI1/e$b;

    .line 14
    .line 15
    const v0, 0x10100a7

    .line 16
    .line 17
    .line 18
    filled-new-array {v0}, [I

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->t0:[I

    .line 23
    .line 24
    new-instance v0, Lcom/android/launcher3/BubbleTextView$a;

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 27
    .line 28
    const-string v2, "dotScale"

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/BubbleTextView$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->u0:Landroid/util/Property;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/BubbleTextView$b;

    .line 36
    .line 37
    const-class v2, Ljava/lang/Float;

    .line 38
    .line 39
    const-string v3, "textAlpha"

    .line 40
    .line 41
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/BubbleTextView$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->v0:Landroid/util/Property;

    .line 45
    .line 46
    new-instance v0, Lcom/android/launcher3/BubbleTextView$c;

    .line 47
    .line 48
    const-class v2, Ljava/lang/Integer;

    .line 49
    .line 50
    const-string v3, "lineIndicatorColor"

    .line 51
    .line 52
    invoke-direct {v0, v2, v3}, Lcom/android/launcher3/BubbleTextView$c;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->w0:Landroid/util/Property;

    .line 56
    .line 57
    new-instance v0, Lcom/android/launcher3/BubbleTextView$d;

    .line 58
    .line 59
    const-string v2, "lineIndicatorScale"

    .line 60
    .line 61
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/BubbleTextView$d;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/android/launcher3/BubbleTextView;->x0:Landroid/util/Property;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    sput-boolean v0, Lcom/android/launcher3/BubbleTextView;->y0:Z

    .line 68
    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/BubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    iput v0, p0, Lcom/android/launcher3/BubbleTextView;->g:F

    .line 4
    new-instance v1, Lcom/android/launcher3/util/z1;

    invoke-direct {v1, p0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/launcher3/BubbleTextView;->k:Lcom/android/launcher3/util/z1;

    const/4 v1, 0x0

    .line 5
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->u:Z

    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->v:Z

    const/4 v2, 0x1

    .line 7
    iput-boolean v2, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 8
    iput v0, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 9
    new-instance v3, Lk1/a;

    invoke-direct {v3}, Lk1/a;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/BubbleTextView;->A:Lk1/a;

    .line 10
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 11
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->a0:Z

    .line 13
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->b0:Z

    .line 14
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    .line 15
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 16
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->e0:Z

    .line 17
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->h0:Z

    .line 18
    const-string v3, ""

    iput-object v3, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 19
    iput v1, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    const/4 v3, 0x0

    .line 20
    iput-object v3, p0, Lcom/android/launcher3/BubbleTextView;->n0:Landroid/animation/ValueAnimator;

    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->o0:Z

    .line 22
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->p0:Z

    .line 23
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->q0:Z

    .line 24
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/android/launcher3/views/k;

    iput-object v3, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 25
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    move-result v4

    invoke-static {v4}, Ls1/o;->q(Z)V

    .line 26
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f140095

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher3/BubbleTextView;->R:Ljava/lang/String;

    .line 27
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f14009d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher3/BubbleTextView;->S:Ljava/lang/String;

    .line 28
    sget-object v4, Lcom/android/launcher3/x5;->J:[I

    invoke-virtual {p1, p2, v4, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, 0x4

    .line 29
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/BubbleTextView;->r:Z

    .line 30
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p3

    if-ne p3, v2, :cond_0

    move p3, v2

    goto :goto_0

    :cond_0
    move p3, v1

    :goto_0
    iput-boolean p3, p0, Lcom/android/launcher3/BubbleTextView;->s:Z

    .line 31
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    .line 32
    invoke-virtual {p2, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/BubbleTextView;->o:Z

    .line 33
    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-nez p3, :cond_2

    .line 34
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget-object p3, p3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean p3, p3, Lcom/android/launcher3/r4;->k:Z

    if-eqz p3, :cond_1

    .line 35
    invoke-virtual {p2, v4, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    if-eq p3, v2, :cond_1

    .line 36
    invoke-virtual {p0, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_1

    .line 37
    :cond_1
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->C1:I

    int-to-float p3, p3

    invoke-virtual {p0, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 38
    :goto_1
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->D1:I

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 39
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->B1:I

    .line 40
    invoke-virtual {p3}, Lcom/android/launcher3/h0;->R0()Z

    move-result p3

    invoke-virtual {p0, p3}, Lcom/android/launcher3/BubbleTextView;->setCenterVertically(Z)V

    goto/16 :goto_6

    :cond_2
    if-eq p3, v2, :cond_c

    const/16 v2, 0x8

    if-eq p3, v2, :cond_c

    const/16 v2, 0x9

    if-eq p3, v2, :cond_c

    const/16 v2, 0xa

    if-ne p3, v2, :cond_3

    goto/16 :goto_4

    :cond_3
    if-ne p3, v4, :cond_5

    .line 41
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget-object v2, p3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    if-eqz v2, :cond_4

    .line 42
    invoke-virtual {p0, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_2

    .line 43
    :cond_4
    iget p3, p3, Lcom/android/launcher3/h0;->Y1:I

    int-to-float p3, p3

    invoke-virtual {p0, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 44
    :goto_2
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->Z1:I

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 45
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->X1:I

    goto/16 :goto_6

    :cond_5
    const/4 v2, 0x6

    if-ne p3, v2, :cond_6

    .line 46
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->N2:F

    invoke-virtual {p0, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 47
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f070a47

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto/16 :goto_6

    :cond_6
    const/4 v2, 0x7

    if-ne p3, v2, :cond_7

    .line 48
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f070a48

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_6

    :cond_7
    const/4 v2, 0x5

    if-ne p3, v2, :cond_8

    .line 49
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->u3:I

    goto :goto_6

    :cond_8
    const/16 v2, 0xb

    if-ne p3, v2, :cond_9

    .line 50
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 52
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f070aab

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_6

    :cond_9
    const/16 v2, 0xc

    if-ne p3, v2, :cond_b

    .line 53
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget-object v2, p3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    if-eqz v2, :cond_a

    .line 54
    invoke-virtual {p0, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_3

    .line 55
    :cond_a
    iget p3, p3, Lcom/android/launcher3/h0;->C1:I

    int-to-float p3, p3

    invoke-virtual {p0, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 56
    :goto_3
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->D1:I

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 57
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->B1:I

    .line 58
    invoke-virtual {p3}, Lcom/android/launcher3/h0;->R0()Z

    move-result p3

    invoke-virtual {p0, p3}, Lcom/android/launcher3/BubbleTextView;->setCenterVertically(Z)V

    goto :goto_6

    .line 59
    :cond_b
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->B1:I

    goto :goto_6

    .line 60
    :cond_c
    :goto_4
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget-object v2, p3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    if-eqz v2, :cond_d

    .line 61
    invoke-virtual {p0, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_5

    .line 62
    :cond_d
    iget p3, p3, Lcom/android/launcher3/h0;->N2:F

    invoke-virtual {p0, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 63
    :goto_5
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget p3, p3, Lcom/android/launcher3/h0;->K2:I

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 64
    iget-object p3, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    iget v1, p3, Lcom/android/launcher3/h0;->J2:I

    :goto_6
    const/4 p3, 0x3

    .line 65
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 66
    iput p3, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    .line 67
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 68
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070bae

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/BubbleTextView;->F:I

    .line 69
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070bac

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/BubbleTextView;->G:I

    .line 70
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f070bad

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/BubbleTextView;->H:I

    .line 71
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/BubbleTextView;->I:Landroid/graphics/Paint;

    .line 72
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0607ec

    .line 73
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 74
    invoke-virtual {p2, p3, v1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/BubbleTextView;->L:I

    .line 75
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0607e6

    .line 76
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    .line 77
    invoke-virtual {p2, p3, p1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->M:I

    .line 78
    new-instance p1, Lcom/android/launcher3/V;

    invoke-direct {p1, p0}, Lcom/android/launcher3/V;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->q:Lcom/android/launcher3/V;

    .line 79
    new-instance p1, Ls1/m$a;

    invoke-direct {p1}, Ls1/m$a;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 80
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p2

    iget p2, p2, Lcom/android/launcher3/h0;->B1:I

    iput p2, p1, Ls1/m$a;->g:I

    .line 81
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p2

    const p3, 0x7f060808

    invoke-static {p2, p3}, Lz/a;->c(Landroid/content/Context;I)I

    move-result p2

    iput p2, p1, Ls1/m$a;->a:I

    .line 82
    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 83
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 84
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 85
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->h0(I)V

    return-void
.end method

.method private D(Lcom/android/launcher3/model/data/z;)Ln1/r;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    if-lt v0, v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string v1, ""

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    if-lez v0, :cond_3

    .line 29
    .line 30
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->J0(Lcom/android/launcher3/model/data/z;I)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 39
    .line 40
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const v3, 0x7f1400a3

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 55
    .line 56
    instance-of v2, v1, Ln1/r;

    .line 57
    .line 58
    if-eqz v2, :cond_4

    .line 59
    .line 60
    check-cast v1, Ln1/r;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->l0(Lcom/android/launcher3/model/data/z;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-virtual {v1, p0}, Ls1/o;->s(Z)V

    .line 70
    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->w0(Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method

.method private E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ls1/o;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private G(Lcom/android/launcher3/model/data/z;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    instance-of v1, v0, Ln1/r;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ln1/r;

    .line 8
    .line 9
    invoke-virtual {v0}, Ln1/r;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ls1/o;->k(Ls1/d;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 24
    .line 25
    instance-of v0, p0, Lr1/c;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    check-cast p0, Lr1/c;

    .line 30
    .line 31
    iget v0, p0, Lr1/c;->U:I

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ls1/o;->k(Ls1/d;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    :cond_1
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method private I()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->D:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private I0(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_1

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const p2, 0x7f140198

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const p2, 0x7f140194

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 p2, 0x2

    .line 37
    if-ne p1, p2, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const p2, 0x7f140196

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method private J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->Q:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private J0(Lcom/android/launcher3/model/data/z;I)V
    .locals 5

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 v1, v0, 0x4000

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 10
    .line 11
    instance-of p2, p2, Ln1/r;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 20
    .line 21
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const v0, 0x7f1400a3

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 41
    .line 42
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const v0, 0x7f14008a

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    and-int/lit16 v0, v0, 0xc00

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    int-to-double v1, p2

    .line 66
    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    mul-double/2addr v1, v3

    .line 72
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iget v0, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 77
    .line 78
    and-int/lit16 v1, v0, 0x400

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 87
    .line 88
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const p2, 0x7f140093

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    and-int/lit16 v0, v0, 0x800

    .line 104
    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 112
    .line 113
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const p2, 0x7f140090

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void
.end method

.method private K()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    int-to-float v0, v0

    .line 16
    const/4 v1, 0x0

    .line 17
    cmpg-float v2, v0, v1

    .line 18
    .line 19
    if-gtz v2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    cmpg-float v4, v4, v0

    .line 42
    .line 43
    if-gez v4, :cond_1

    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :cond_1
    const v4, -0x42b33333    # -0.05f

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, v3, v2, v0, v4}, Lcom/android/launcher3/BubbleTextView;->b0(Landroid/text/TextPaint;Ljava/lang/String;FF)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {v3, v1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private M0(Lcom/android/launcher3/model/data/z;Ls1/o;)Z
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0xc00

    .line 4
    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    instance-of p0, p1, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_2

    .line 18
    .line 19
    :cond_0
    instance-of p0, p2, Ln1/r;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    check-cast p2, Ln1/r;

    .line 24
    .line 25
    invoke-virtual {p2}, Ln1/r;->z()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method private R(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 2
    .line 3
    if-eqz p1, :cond_6

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const/16 v1, 0xc

    .line 20
    .line 21
    if-eq p1, v1, :cond_1

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->j0()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_6

    .line 28
    .line 29
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 36
    .line 37
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    instance-of p1, p1, Lcom/android/launcher3/model/data/y;

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 61
    .line 62
    iget-boolean p1, p1, Lcom/android/launcher3/model/data/y;->isShowAppName:Z

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {p0, v1, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 72
    .line 73
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget v2, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 78
    .line 79
    if-eqz v2, :cond_5

    .line 80
    .line 81
    if-eq v2, v0, :cond_4

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->j0()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget p1, p1, Lcom/android/launcher3/h0;->N2:F

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    iget p1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 93
    .line 94
    :goto_0
    int-to-float p1, p1

    .line 95
    goto :goto_1

    .line 96
    :cond_4
    iget p1, p1, Lcom/android/launcher3/h0;->Y1:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    iget p1, p1, Lcom/android/launcher3/h0;->C1:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :goto_1
    invoke-virtual {p0, v1, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 103
    .line 104
    .line 105
    :cond_6
    :goto_2
    return-void
.end method

.method private S(Landroid/graphics/Canvas;Ls1/m$a;F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean v1, p2, Ls1/m$a;->h:Z

    .line 16
    .line 17
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v1, p2, Ls1/m$a;->h:Z

    .line 24
    .line 25
    invoke-direct {p0, v1}, Lcom/android/launcher3/BubbleTextView;->setCheckboxDrawable(Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 30
    .line 31
    iget-boolean v2, p2, Ls1/m$a;->h:Z

    .line 32
    .line 33
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    iget-boolean v1, p2, Ls1/m$a;->h:Z

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 50
    .line 51
    iget-boolean v1, p2, Ls1/m$a;->h:Z

    .line 52
    .line 53
    invoke-direct {p0, v1}, Lcom/android/launcher3/BubbleTextView;->S0(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const v2, 0x7f0704dc

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    mul-float/2addr v1, p3

    .line 71
    float-to-int v1, v1

    .line 72
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const v3, 0x7f0701a4

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    int-to-float v2, v2

    .line 84
    mul-float/2addr v2, p3

    .line 85
    float-to-int v2, v2

    .line 86
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_2

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    const v3, 0x7f0701a5

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    int-to-float v2, v2

    .line 108
    mul-float/2addr v2, p3

    .line 109
    float-to-int v2, v2

    .line 110
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 111
    .line 112
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 117
    .line 118
    if-nez v3, :cond_3

    .line 119
    .line 120
    const v3, 0x7f0701a2

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    const v3, 0x7f0701a3

    .line 125
    .line 126
    .line 127
    :goto_1
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    int-to-float v0, v0

    .line 136
    mul-float/2addr v0, p3

    .line 137
    float-to-int p3, v0

    .line 138
    iget-object p2, p2, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 139
    .line 140
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 141
    .line 142
    sub-int/2addr v0, p3

    .line 143
    mul-int/lit8 v3, v1, 0x6

    .line 144
    .line 145
    add-int/2addr v0, v3

    .line 146
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 147
    .line 148
    sub-int/2addr p2, p3

    .line 149
    mul-int/lit8 v1, v1, 0x4

    .line 150
    .line 151
    add-int/2addr p2, v1

    .line 152
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    sub-int/2addr p3, v2

    .line 157
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    const/4 v0, 0x0

    .line 162
    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    sub-int/2addr v1, v2

    .line 171
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 180
    .line 181
    if-eqz v0, :cond_4

    .line 182
    .line 183
    add-int v1, p3, v2

    .line 184
    .line 185
    add-int/2addr v2, p2

    .line 186
    invoke-virtual {v0, p3, p2, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 192
    .line 193
    .line 194
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method private S0(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    instance-of v2, v1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    check-cast v1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimatedVectorDrawable;->stop()V

    .line 14
    .line 15
    .line 16
    :cond_0
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const p1, 0x7f080e2a

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const p1, 0x7f080e2c

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-static {v0, p1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    const-string p0, "BubbleTextView"

    .line 34
    .line 35
    const-string p1, "startCheckBoxAnim: checkbox drawable is null."

    .line 36
    .line 37
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    instance-of v0, p1, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    check-cast p0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method private T(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    const/high16 v1, 0x1000000

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/folderbatch/FolderBatch;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->o0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_6

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->p0:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    instance-of v2, v1, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->a0()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const/4 v1, 0x0

    .line 52
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    instance-of v2, v2, Lcom/android/launcher3/model/data/y;

    .line 57
    .line 58
    if-eqz v2, :cond_6

    .line 59
    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    if-eqz v1, :cond_6

    .line 63
    .line 64
    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 69
    .line 70
    iget-boolean v1, v0, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 71
    .line 72
    if-eqz v1, :cond_6

    .line 73
    .line 74
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 75
    .line 76
    const/16 v1, -0x65

    .line 77
    .line 78
    if-ne v0, v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    instance-of v0, v0, Lcom/android/launcher3/folderbatch/FolderBatchRecyclerView;

    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    :cond_4
    invoke-static {}, Lx1/O;->C3()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    invoke-static {p0}, Lp1/f;->y(Landroid/view/View;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 102
    .line 103
    iget-object v0, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    int-to-float v2, v0

    .line 117
    int-to-float v3, v1

    .line 118
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 122
    .line 123
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Lcom/android/launcher3/X3;->j()F

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 138
    .line 139
    iget-boolean v4, v4, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 140
    .line 141
    iput-boolean v4, v3, Ls1/m$a;->h:Z

    .line 142
    .line 143
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 144
    .line 145
    invoke-direct {p0, p1, v3, v2}, Lcom/android/launcher3/BubbleTextView;->S(Landroid/graphics/Canvas;Ls1/m$a;F)V

    .line 146
    .line 147
    .line 148
    neg-int p0, v0

    .line 149
    int-to-float p0, p0

    .line 150
    neg-int v0, v1

    .line 151
    int-to-float v0, v0

    .line 152
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 153
    .line 154
    .line 155
    :cond_6
    :goto_1
    return-void
.end method

.method private U0(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, v1, p1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private V(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->q0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->k0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 23
    .line 24
    iget-object v1, v1, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->m0()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-float v3, v1

    .line 46
    int-to-float v4, v2

    .line 47
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Lcom/android/launcher3/X3;->j()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->s0()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    iget v3, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 67
    .line 68
    int-to-float v3, v3

    .line 69
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    .line 70
    .line 71
    iget v4, v4, Lcom/android/launcher3/h0;->B1:I

    .line 72
    .line 73
    int-to-float v4, v4

    .line 74
    div-float/2addr v3, v4

    .line 75
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 86
    .line 87
    invoke-virtual {v4, p1, v5, p0, v3}, Ls1/m;->c(Landroid/graphics/Canvas;Landroid/content/Context;Ls1/m$a;F)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x4

    .line 91
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 92
    .line 93
    .line 94
    neg-int p0, v1

    .line 95
    int-to-float p0, p0

    .line 96
    neg-int v0, v2

    .line 97
    int-to-float v0, v0

    .line 98
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_1
    return-void
.end method

.method private X(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v2, v0

    .line 47
    int-to-float v3, v1

    .line 48
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v2}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 57
    .line 58
    .line 59
    new-instance v3, Landroid/graphics/RectF;

    .line 60
    .line 61
    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 62
    .line 63
    .line 64
    new-instance v4, Landroid/graphics/Paint;

    .line 65
    .line 66
    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    .line 70
    .line 71
    .line 72
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 73
    .line 74
    int-to-float v3, v3

    .line 75
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    int-to-float v2, v2

    .line 78
    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2, p1}, Ls1/o;->draw(Landroid/graphics/Canvas;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const v2, 0x7f060258

    .line 93
    .line 94
    .line 95
    invoke-static {p0, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 100
    .line 101
    invoke-virtual {p1, p0, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 105
    .line 106
    .line 107
    neg-int p0, v0

    .line 108
    int-to-float p0, p0

    .line 109
    neg-int v0, v1

    .line 110
    int-to-float v0, v0

    .line 111
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 112
    .line 113
    .line 114
    :cond_2
    :goto_0
    return-void
.end method

.method private b0(Landroid/text/TextPaint;Ljava/lang/String;FF)F
    .locals 3

    .line 1
    invoke-virtual {p1, p4}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    cmpl-float p0, p0, p3

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    return p4

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    const/16 v1, 0x14

    .line 16
    .line 17
    if-ge v0, v1, :cond_2

    .line 18
    .line 19
    add-float v1, p0, p4

    .line 20
    .line 21
    const/high16 v2, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float/2addr v1, v2

    .line 24
    invoke-virtual {p1, v1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    cmpg-float v2, v2, p3

    .line 32
    .line 33
    if-gez v2, :cond_1

    .line 34
    .line 35
    move p4, v1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move p0, v1

    .line 38
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return p4
.end method

.method public static synthetic c(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->u0(Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c0(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Landroid/icu/text/MessageFormat;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v1, 0x7f140193

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, p0, v1}, Landroid/icu/text/MessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "app_name"

    .line 27
    .line 28
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "count"

    .line 36
    .line 37
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroid/icu/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method private getIconOrTransparentColor()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method private getModifiedColor()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 11
    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-float v1, v1

    .line 17
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 18
    .line 19
    mul-float/2addr v1, p0

    .line 20
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {v0, p0}, Ls1/q;->h(II)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method private getNotificationCount()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->A:Lk1/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lk1/a;->d()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1, v2}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->x(Lcom/android/launcher3/BubbleTextView;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->q(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    move-object v1, p0

    .line 36
    :cond_1
    if-eqz v1, :cond_4

    .line 37
    .line 38
    instance-of p0, v1, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    move-object v2, v1

    .line 43
    check-cast v2, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 44
    .line 45
    iget-boolean v2, v2, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->pushIconUseAppBadge:Z

    .line 46
    .line 47
    if-nez v2, :cond_3

    .line 48
    .line 49
    :cond_2
    const/4 v0, 0x1

    .line 50
    :cond_3
    if-eqz p0, :cond_4

    .line 51
    .line 52
    check-cast v1, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 53
    .line 54
    iget p0, v1, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->badgeNumber:I

    .line 55
    .line 56
    if-ltz p0, :cond_4

    .line 57
    .line 58
    iget-boolean v1, v1, Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;->pushIconUseAppBadge:Z

    .line 59
    .line 60
    if-nez v1, :cond_4

    .line 61
    .line 62
    return p0

    .line 63
    :cond_4
    return v0
.end method

.method private h0(I)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v1, :cond_0

    .line 4
    .line 5
    move v2, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v0

    .line 8
    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 17
    .line 18
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->Y:Z

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lm1/a;->a()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    :cond_1
    if-eq p1, v3, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    instance-of v2, v2, Lcom/android/launcher3/C2;

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->O2()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    move v2, v1

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v2, v0

    .line 64
    :goto_1
    iput-boolean v2, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 65
    .line 66
    iget-boolean v4, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    .line 67
    .line 68
    if-nez v4, :cond_3

    .line 69
    .line 70
    if-nez v2, :cond_3

    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 73
    .line 74
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    iput v2, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 79
    .line 80
    :cond_3
    iget-boolean v2, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 81
    .line 82
    if-eqz v2, :cond_5

    .line 83
    .line 84
    if-eq p1, v3, :cond_4

    .line 85
    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    const/16 v2, 0xc

    .line 89
    .line 90
    if-ne p1, v2, :cond_5

    .line 91
    .line 92
    :cond_4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const v2, 0x7f060156

    .line 97
    .line 98
    .line 99
    invoke-static {p1, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getModifiedColor()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 113
    .line 114
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 119
    .line 120
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->c:Z

    .line 121
    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 128
    .line 129
    .line 130
    const/4 p1, 0x0

    .line 131
    const v0, 0x3f666666    # 0.9f

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_6
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 139
    .line 140
    .line 141
    :goto_2
    iget-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    .line 142
    .line 143
    if-eqz p1, :cond_8

    .line 144
    .line 145
    invoke-static {}, Lx1/O;->t()Ljava/lang/Boolean;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_7

    .line 154
    .line 155
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 156
    .line 157
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_7
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    const v0, 0x7f06003e

    .line 169
    .line 170
    .line 171
    invoke-static {p1, v0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 176
    .line 177
    :goto_3
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getModifiedColor()I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 182
    .line 183
    .line 184
    :cond_8
    return-void
.end method

.method private j0()Z
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    if-eq p0, v1, :cond_1

    .line 9
    .line 10
    const/16 v1, 0x9

    .line 11
    .line 12
    if-eq p0, v1, :cond_1

    .line 13
    .line 14
    const/16 v1, 0xa

    .line 15
    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x6

    .line 19
    if-ne p0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    return v0
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->t0(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/BubbleTextView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 2
    .line 3
    return p0
.end method

.method private m0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->a0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget-boolean p0, Lcom/android/launcher3/BubbleTextView;->y0:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/BubbleTextView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/BubbleTextView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/BubbleTextView;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->D:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/BubbleTextView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic r(Lcom/android/launcher3/BubbleTextView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 2
    .line 3
    return-void
.end method

.method private setCheckboxDrawable(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const p1, 0x7f080e2b

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const p1, 0x7f080e29

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-static {v0, p1}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->j0:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    return-void
.end method

.method private setNonPendingIcon(Lcom/android/launcher3/model/data/z;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.android.privatespace"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    iget v0, v0, Ls1/d;->e:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->Q0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move v0, v2

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v0, v1

    .line 29
    :goto_0
    iget-boolean v3, p0, Lcom/android/launcher3/BubbleTextView;->u:Z

    .line 30
    .line 31
    if-nez v3, :cond_2

    .line 32
    .line 33
    iget v3, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 34
    .line 35
    const/4 v4, 0x7

    .line 36
    if-ne v3, v4, :cond_3

    .line 37
    .line 38
    :cond_2
    or-int/lit8 v0, v0, 0x2

    .line 39
    .line 40
    :cond_3
    iget-boolean v3, p0, Lcom/android/launcher3/BubbleTextView;->v:Z

    .line 41
    .line 42
    if-eqz v3, :cond_4

    .line 43
    .line 44
    or-int/lit8 v0, v0, 0x4

    .line 45
    .line 46
    :cond_4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {p1, v3, v0}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 55
    .line 56
    invoke-virtual {v0}, Ls1/o;->i()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    iput v4, v3, Ls1/m$a;->b:I

    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    const v5, 0x7f060808

    .line 69
    .line 70
    .line 71
    invoke-static {v4, v5}, Lz/a;->c(Landroid/content/Context;I)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    iput v4, v3, Ls1/m$a;->a:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v0, v3}, Lcom/android/launcher3/H5;->w0(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput-boolean v0, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 97
    .line 98
    invoke-static {}, Lx1/O;->U3()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 105
    .line 106
    instance-of v3, v0, Lcom/android/launcher3/C2;

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v0, v3}, Lcom/android/launcher3/D3;->r0(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    iput-boolean v2, p1, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 129
    .line 130
    :cond_5
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0, v1}, Lx1/O;->K2(Landroid/content/Context;Z)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_6

    .line 139
    .line 140
    instance-of p0, p1, Lcom/android/launcher3/model/data/I;

    .line 141
    .line 142
    if-eqz p0, :cond_6

    .line 143
    .line 144
    move-object p0, p1

    .line 145
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 146
    .line 147
    invoke-static {p0}, Lx1/O;->J2(Lcom/android/launcher3/model/data/I;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_6

    .line 152
    .line 153
    iput-boolean v2, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 154
    .line 155
    :cond_6
    return-void
.end method

.method private setTextWithArchivingIcon(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/content/res/Configuration;->fontWeightAdjustment:I

    .line 10
    .line 11
    const/16 v1, 0x12c

    .line 12
    .line 13
    if-lt v0, v1, :cond_0

    .line 14
    .line 15
    const v0, 0x7f0809fe

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const v0, 0x7f0809fd

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->L0(Ljava/lang/CharSequence;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic t0(Lcom/android/launcher3/model/data/z;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move-object p1, v0

    .line 10
    check-cast p1, Lcom/android/launcher3/model/data/z;

    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setNonPendingIcon(Lcom/android/launcher3/model/data/z;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic u0(Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V
    .locals 9

    .line 1
    const-string v0, "BubbleTextView"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :try_start_0
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    const-string v4, "activity"

    .line 13
    .line 14
    invoke-virtual {p2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Landroid/app/ActivityManager;

    .line 19
    .line 20
    const-string v4, "android.app.ActivityManager"

    .line 21
    .line 22
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const-string v5, "preStartProcess"

    .line 27
    .line 28
    const-class v6, Ljava/lang/String;

    .line 29
    .line 30
    const-class v7, Landroid/content/Intent;

    .line 31
    .line 32
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 33
    .line 34
    filled-new-array {v6, v7, v8}, [Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 50
    .line 51
    invoke-virtual {v5, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    filled-new-array {v3, v2, p1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v4, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string p2, "preStartProcess packageName:"

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_0
    move-exception p1

    .line 88
    new-instance p2, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v2, "preStartProcess e:"

    .line 94
    .line 95
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 113
    .line 114
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "\u8c03\u7528\u5931\u8d25: ${e.message}"

    .line 123
    .line 124
    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method private w0(Lcom/android/launcher3/model/data/z;)Ln1/r;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1, p1}, Ln1/r;->B(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->l0(Lcom/android/launcher3/model/data/z;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v1, p0}, Ls1/o;->s(Z)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method private x0(Lcom/android/launcher3/model/data/z;Ls1/o;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->M0(Lcom/android/launcher3/model/data/z;Ls1/o;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    move-object p2, p1

    .line 13
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->W()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p2, p1, v0}, Lcom/android/launcher3/BubbleTextView;->E(Lcom/android/launcher3/model/data/I;IZ)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->D(Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    move-object v0, p1

    .line 39
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    return-void

    .line 49
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_6

    .line 54
    .line 55
    :goto_1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/16 v2, 0x64

    .line 60
    .line 61
    if-ne v0, v2, :cond_6

    .line 62
    .line 63
    if-eqz v1, :cond_6

    .line 64
    .line 65
    instance-of v0, p2, Ln1/r;

    .line 66
    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    check-cast p2, Ln1/r;

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_5
    move-object p2, v1

    .line 73
    :goto_2
    new-instance v0, Lcom/android/launcher3/K;

    .line 74
    .line 75
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/K;-><init>(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, p2, v0}, Ln1/r;->A(Ln1/r;Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    :cond_6
    :goto_3
    return-void
.end method

.method public static y0(IILjava/lang/CharSequence;Landroid/text/TextPaint;Lcom/android/launcher3/util/x0;FF)Ljava/lang/CharSequence;
    .locals 11

    .line 1
    if-eqz p2, :cond_9

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {p3, p2, v3, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v4, p0

    .line 13
    cmpg-float v1, v1, v4

    .line 14
    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_4

    .line 18
    .line 19
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const v5, -0x42b33333    # -0.05f

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3, v5}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 28
    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    move v6, v3

    .line 32
    move v7, v6

    .line 33
    :goto_0
    invoke-virtual {p4}, Lcom/android/launcher3/util/x0;->size()I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    const/4 v9, 0x1

    .line 38
    add-int/2addr v8, v9

    .line 39
    if-ge v6, v8, :cond_8

    .line 40
    .line 41
    invoke-virtual {p4}, Lcom/android/launcher3/util/x0;->size()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    if-ge v6, v8, :cond_1

    .line 46
    .line 47
    invoke-virtual {p4, v6}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    add-int/2addr v8, v9

    .line 52
    invoke-interface {p2, v7, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    invoke-interface {p2, v7, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    :goto_1
    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    .line 66
    .line 67
    .line 68
    move-result v10

    .line 69
    invoke-virtual {p3, v8, v3, v10}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    add-float/2addr v5, v10

    .line 74
    cmpg-float v10, v5, v4

    .line 75
    .line 76
    if-gtz v10, :cond_3

    .line 77
    .line 78
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p4}, Lcom/android/launcher3/util/x0;->size()I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-lt v6, v7, :cond_2

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_2
    invoke-virtual {p4, v6}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    add-int/2addr v7, v9

    .line 93
    add-int/lit8 v6, v6, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    if-eqz v6, :cond_7

    .line 97
    .line 98
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-interface {p2, v7, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-static {v3}, Ljava/lang/Character;->getType(I)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    const/16 v4, 0xc

    .line 115
    .line 116
    if-eq v3, v4, :cond_4

    .line 117
    .line 118
    const/16 v4, 0xd

    .line 119
    .line 120
    if-ne v3, v4, :cond_6

    .line 121
    .line 122
    :cond_4
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-le v3, v9, :cond_5

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-interface {v0, v9, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    goto :goto_2

    .line 137
    :cond_5
    const-string v0, ""

    .line 138
    .line 139
    :cond_6
    :goto_2
    sget-object v3, Lcom/android/launcher3/BubbleTextView;->r0:Ljava/lang/Character;

    .line 140
    .line 141
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    new-instance v0, Landroid/text/StaticLayout;

    .line 148
    .line 149
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 150
    .line 151
    const/4 v7, 0x0

    .line 152
    move v3, p0

    .line 153
    move-object v2, p3

    .line 154
    move/from16 v5, p5

    .line 155
    .line 156
    move/from16 v6, p6

    .line 157
    .line 158
    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getHeight()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-ge p0, p1, :cond_7

    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0

    .line 172
    :cond_7
    return-object p2

    .line 173
    :cond_8
    :goto_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :cond_9
    :goto_4
    return-object p2
.end method

.method private z0(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x5dc

    .line 2
    .line 3
    invoke-static {v0, v1}, Lx1/O;->p4(J)Z

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 7
    .line 8
    new-instance v1, Lcom/android/launcher3/L;

    .line 9
    .line 10
    invoke-direct {v1, p0, p2, p1}, Lcom/android/launcher3/L;-><init>(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public A(Lcom/android/launcher3/model/data/z;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->G(Lcom/android/launcher3/model/data/z;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setNonPendingIcon(Lcom/android/launcher3/model/data/z;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->B(Lcom/android/launcher3/model/data/y;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->x0(Lcom/android/launcher3/model/data/z;Ls1/o;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public A0(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->f0:Ljava/util/function/Consumer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/BubbleTextView;->g0:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-void
.end method

.method public B(Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->i:Ljava/lang/CharSequence;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->j:Ljava/lang/CharSequence;

    .line 8
    .line 9
    sget-object v1, Lcom/android/launcher3/BubbleTextView;->s0:LI1/e$b;

    .line 10
    .line 11
    invoke-static {v0, v1}, LI1/e;->c(Ljava/lang/CharSequence;LI1/e$b;)Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lcom/android/launcher3/BubbleTextView;->h:Lcom/android/launcher3/util/x0;

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->I0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    instance-of v1, p1, Lcom/android/launcher3/model/data/z;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    move-object v1, p1

    .line 28
    check-cast v1, Lcom/android/launcher3/model/data/z;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-direct {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setTextWithArchivingIcon(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 58
    .line 59
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const v1, 0x7f140191

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 72
    .line 73
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    return-void
.end method

.method public B0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Ls1/m$a;->a:I

    .line 5
    .line 6
    iput v1, v0, Ls1/m$a;->b:I

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->I()V

    .line 9
    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iput v1, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput v2, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 21
    .line 22
    iput v1, p0, Lcom/android/launcher3/BubbleTextView;->P:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->J()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 31
    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/android/launcher3/util/w;->e()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setPivotY(F)V

    .line 40
    .line 41
    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setScaleY(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public C(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 16
    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "applyLimitState: item: "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", isLimited: "

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "BubbleTextView"

    .line 59
    .line 60
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 68
    .line 69
    iput-boolean p1, v0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Ls1/m$a;->a:I

    .line 5
    .line 6
    iput v1, v0, Ls1/m$a;->b:I

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->I()V

    .line 9
    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/util/w;->e()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public D0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    instance-of v0, v0, Lr1/c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "resetDownloadInstallDrawable info.title: "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "BubbleTextView"

    .line 33
    .line 34
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 38
    .line 39
    check-cast v0, Lr1/c;

    .line 40
    .line 41
    invoke-virtual {v0}, Lr1/c;->x()V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public E(Lcom/android/launcher3/model/data/I;IZ)V
    .locals 7

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    int-to-double v3, p2

    .line 14
    const-wide v5, 0x3f847ae147ae147bL    # 0.01

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    mul-double/2addr v3, v5

    .line 20
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const v2, 0x7f140090

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 41
    .line 42
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const v2, 0x7f1400a3

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->W()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->U()Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/BubbleTextView;->I0(IZ)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 72
    .line 73
    if-eqz v2, :cond_b

    .line 74
    .line 75
    const/4 v3, 0x2

    .line 76
    const/4 v4, 0x3

    .line 77
    const/4 v5, 0x1

    .line 78
    if-eq v0, v5, :cond_3

    .line 79
    .line 80
    if-eq v0, v3, :cond_3

    .line 81
    .line 82
    if-ne v0, v4, :cond_1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_1
    const/4 p2, 0x4

    .line 86
    if-ne v0, p2, :cond_b

    .line 87
    .line 88
    instance-of p2, v2, Lr1/a;

    .line 89
    .line 90
    if-eqz p2, :cond_2

    .line 91
    .line 92
    check-cast v2, Lr1/a;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    new-instance v2, Lr1/a;

    .line 96
    .line 97
    iget-object p2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 98
    .line 99
    check-cast p2, Landroid/content/Context;

    .line 100
    .line 101
    invoke-direct {v2, p2, p1}, Lr1/a;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v2}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V

    .line 105
    .line 106
    .line 107
    :goto_1
    invoke-virtual {v2}, Lr1/a;->x()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    :goto_2
    if-ne v0, v4, :cond_4

    .line 112
    .line 113
    iget-boolean v6, p0, Lcom/android/launcher3/BubbleTextView;->b0:Z

    .line 114
    .line 115
    if-eqz v6, :cond_4

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :cond_4
    instance-of v6, v2, Lr1/c;

    .line 119
    .line 120
    if-eqz v6, :cond_5

    .line 121
    .line 122
    check-cast v2, Lr1/c;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_5
    new-instance v2, Lr1/c;

    .line 126
    .line 127
    invoke-direct {v2, p0, p1}, Lr1/c;-><init>(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v2}, Lcom/android/launcher3/BubbleTextView;->setIcon(Ls1/o;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v2, p2}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 134
    .line 135
    .line 136
    :goto_3
    invoke-virtual {v2, v0}, Lr1/c;->z(I)V

    .line 137
    .line 138
    .line 139
    if-nez p3, :cond_6

    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_a

    .line 146
    .line 147
    :cond_6
    if-eq v0, v5, :cond_9

    .line 148
    .line 149
    const/16 p2, 0x64

    .line 150
    .line 151
    if-eq v0, v3, :cond_8

    .line 152
    .line 153
    if-eq v0, v4, :cond_7

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_7
    invoke-virtual {v2}, Lr1/c;->C()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 160
    .line 161
    .line 162
    iput-boolean v5, p0, Lcom/android/launcher3/BubbleTextView;->b0:Z

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_8
    invoke-virtual {p1, p2}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 166
    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->S()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    invoke-virtual {v2, p0}, Lr1/c;->A(I)V

    .line 174
    .line 175
    .line 176
    :cond_a
    :goto_4
    if-ne v0, v5, :cond_b

    .line 177
    .line 178
    invoke-virtual {v2}, Lr1/c;->w()Ljava/lang/Boolean;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-eq p0, v1, :cond_b

    .line 187
    .line 188
    invoke-virtual {v2, v1}, Lr1/c;->y(Z)V

    .line 189
    .line 190
    .line 191
    :cond_b
    :goto_5
    return-void
.end method

.method public F(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 16
    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "applyVdmcLimitState: item: "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", isLimited: "

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "BubbleTextView"

    .line 59
    .line 60
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 68
    .line 69
    iput-boolean p1, v0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public F0()V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, v1}, Lcom/android/launcher3/BubbleTextView;->K0(III)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G0()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->k0:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public H()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public H0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->f0:Ljava/util/function/Consumer;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->g0:Ljava/lang/Runnable;

    .line 5
    .line 6
    return-void
.end method

.method public K0(III)V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 9
    .line 10
    if-eq v0, p1, :cond_2

    .line 11
    .line 12
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 15
    .line 16
    iput p1, v0, Ls1/m$a;->g:I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U0(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    if-eqz p2, :cond_2

    .line 32
    .line 33
    if-eqz p3, :cond_2

    .line 34
    .line 35
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 36
    .line 37
    sub-int/2addr p3, p1

    .line 38
    div-int/lit8 p3, p3, 0x2

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-virtual {p0, p1, p3, p2, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->i0:Lcom/android/launcher3/iconarrange/a;

    .line 3
    .line 4
    return-void
.end method

.method public L0(Ljava/lang/CharSequence;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "BubbleTextView"

    .line 15
    .line 16
    const-string p1, "setTextWithStartIcon: start icon Drawable not found from resources, will just set text instead."

    .line 17
    .line 18
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/text/style/ImageSpan;

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-direct {v0, p2, v1}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Landroid/text/SpannableString;

    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v3, "  "

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-direct {p2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    const/4 p1, 0x1

    .line 78
    const/16 v1, 0x11

    .line 79
    .line 80
    invoke-virtual {p2, v0, v2, p1, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setPressed(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setStayPressed(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N(Ljava/lang/Runnable;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->g0:Ljava/lang/Runnable;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_8

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v3, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v3

    .line 15
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-static {v4}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->g0:Z

    .line 24
    .line 25
    if-eqz v4, :cond_1

    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    if-eqz v4, :cond_2

    .line 32
    .line 33
    move v5, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move-object v4, v2

    .line 36
    :cond_2
    move v5, v3

    .line 37
    :goto_0
    if-eqz v5, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    instance-of v5, v5, Lcom/android/launcher3/model/data/y;

    .line 44
    .line 45
    if-eqz v5, :cond_4

    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-nez v4, :cond_4

    .line 66
    .line 67
    instance-of p0, p0, Lcom/android/launcher3/shortcuts/DeepShortcutTextView;

    .line 68
    .line 69
    if-nez p0, :cond_3

    .line 70
    .line 71
    return v1

    .line 72
    :cond_3
    return v3

    .line 73
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Z2()Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_6

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getTargetPackageName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_5

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    move-object p1, v2

    .line 91
    :goto_1
    invoke-interface {v0, v1, p1}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 92
    .line 93
    .line 94
    return p0

    .line 95
    :cond_6
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->u0(Landroid/view/View;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_7

    .line 100
    .line 101
    invoke-interface {v0, v3, v2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 102
    .line 103
    .line 104
    :cond_7
    return v3

    .line 105
    :cond_8
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 106
    .line 107
    .line 108
    iput-object v2, p0, Lcom/android/launcher3/BubbleTextView;->g0:Ljava/lang/Runnable;

    .line 109
    .line 110
    return v1
.end method

.method public N0()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->P0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/android/launcher3/Y4;->j(Landroid/content/Context;)Lcom/android/launcher3/Y4;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/Y4;->l()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/y0;->j()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public O(Landroid/graphics/Paint$FontMetrics;I)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->c:Z

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget v3, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    add-int/2addr v3, v4

    .line 25
    iget v4, p1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 26
    .line 27
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 28
    .line 29
    sub-float/2addr v4, p1

    .line 30
    float-to-double v4, v4

    .line 31
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    double-to-int p1, v4

    .line 36
    mul-int/2addr p1, v0

    .line 37
    add-int/2addr v3, p1

    .line 38
    sub-int/2addr p2, v3

    .line 39
    div-int/2addr p2, v1

    .line 40
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 47
    .line 48
    if-ne p1, v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 55
    .line 56
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    const p0, 0x7f0c007e

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const p0, 0x7f0c007d

    .line 69
    .line 70
    .line 71
    :goto_1
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    int-to-float p0, p0

    .line 76
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0

    .line 81
    :cond_2
    if-ne p1, v2, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const p1, 0x7f0c0006

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    int-to-float p0, p0

    .line 95
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0

    .line 100
    :cond_3
    return p2
.end method

.method protected O0(FF)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    xor-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    return p0
.end method

.method public P(Z)Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->P0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    sget-object v0, Lcom/android/launcher3/BubbleTextView;->v0:Landroid/util/Property;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    new-array v1, v1, [F

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    aput p1, v1, v2

    .line 20
    .line 21
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public P0()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    :goto_1
    const/4 v1, 0x0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 36
    .line 37
    const/16 v2, -0x65

    .line 38
    .line 39
    if-eq v0, v2, :cond_2

    .line 40
    .line 41
    const/16 v2, -0x67

    .line 42
    .line 43
    if-ne v0, v2, :cond_3

    .line 44
    .line 45
    :cond_2
    return v1

    .line 46
    :cond_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    return v1

    .line 59
    :cond_4
    const/4 p0, 0x1

    .line 60
    return p0
.end method

.method public Q(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const v4, 0x7f07011a

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const v5, 0x7f07011b

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-virtual {v5, v2, v7, v6}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    add-int/2addr v4, v3

    .line 57
    mul-int/lit8 v4, v4, 0x2

    .line 58
    .line 59
    int-to-float v4, v4

    .line 60
    add-float/2addr v2, v4

    .line 61
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    int-to-float v4, v4

    .line 66
    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    new-instance v4, Landroid/graphics/RectF;

    .line 71
    .line 72
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    int-to-float v5, v5

    .line 77
    sub-float/2addr v5, v2

    .line 78
    const/high16 v6, 0x40000000    # 2.0f

    .line 79
    .line 80
    div-float/2addr v5, v6

    .line 81
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    int-to-float v7, v7

    .line 86
    sub-float/2addr v5, v7

    .line 87
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    int-to-float v1, v1

    .line 92
    add-float/2addr v1, v2

    .line 93
    div-float/2addr v1, v6

    .line 94
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    int-to-float v2, v2

    .line 99
    add-float/2addr v1, v2

    .line 100
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 101
    .line 102
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 103
    .line 104
    sub-float/2addr v2, v0

    .line 105
    float-to-double v7, v2

    .line 106
    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    .line 107
    .line 108
    .line 109
    move-result-wide v7

    .line 110
    double-to-int v0, v7

    .line 111
    int-to-float v0, v0

    .line 112
    const/4 v2, 0x0

    .line 113
    invoke-direct {v4, v5, v2, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 114
    .line 115
    .line 116
    mul-int/lit8 v3, v3, 0x2

    .line 117
    .line 118
    int-to-float v0, v3

    .line 119
    invoke-virtual {v4, v0, v2}, Landroid/graphics/RectF;->inset(FF)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 123
    .line 124
    if-eqz v0, :cond_0

    .line 125
    .line 126
    new-instance v0, Landroid/graphics/Rect;

    .line 127
    .line 128
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 132
    .line 133
    .line 134
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    add-int/2addr v0, v1

    .line 141
    int-to-float v0, v0

    .line 142
    invoke-virtual {v4, v2, v0}, Landroid/graphics/RectF;->offset(FF)V

    .line 143
    .line 144
    .line 145
    :cond_0
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    div-float/2addr v0, v6

    .line 150
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    div-float/2addr v1, v6

    .line 155
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {p0}, Lcom/android/launcher3/Y4;->j(Landroid/content/Context;)Lcom/android/launcher3/Y4;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Lcom/android/launcher3/Y4;->h()Landroid/graphics/Paint;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p1, v4, v0, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method protected Q0()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0xc

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ln1/C;

    .line 26
    .line 27
    invoke-virtual {p0}, Ln1/C;->n()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method protected R0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/android/launcher3/F1;->B1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    if-ne p0, v1, :cond_1

    .line 17
    .line 18
    :cond_0
    return v0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public T0()Lcom/android/launcher3/dragndrop/p$a;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k0(Landroid/view/View;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->a0(Z)Lcom/android/launcher3/dragndrop/p$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method protected U(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v1, v1, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget v1, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getNotificationCount()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iput v2, v1, Ls1/m$a;->f:I

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Lcom/android/launcher3/nubia/c;->s(Landroid/content/Context;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz v1, :cond_4

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v1, v3}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->x(Lcom/android/launcher3/BubbleTextView;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->q(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-eqz v3, :cond_1

    .line 71
    .line 72
    move-object v1, v3

    .line 73
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getNotificationCount()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    iput v4, v3, Ls1/m$a;->f:I

    .line 80
    .line 81
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 82
    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getMsg()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const-string v4, ""

    .line 91
    .line 92
    :goto_0
    iput-object v4, v3, Ls1/m$a;->k:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 95
    .line 96
    const-string v4, "1"

    .line 97
    .line 98
    iget-object v5, v3, Ls1/m$a;->k:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    xor-int/2addr v4, v2

    .line 105
    iput-boolean v4, v3, Ls1/m$a;->l:Z

    .line 106
    .line 107
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 108
    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getBgColor()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_1

    .line 116
    :cond_3
    iget v1, v3, Ls1/m$a;->m:I

    .line 117
    .line 118
    :goto_1
    iput v1, v3, Ls1/m$a;->m:I

    .line 119
    .line 120
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 121
    .line 122
    if-eqz v1, :cond_a

    .line 123
    .line 124
    iget-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 125
    .line 126
    if-nez v1, :cond_a

    .line 127
    .line 128
    if-nez v0, :cond_5

    .line 129
    .line 130
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 131
    .line 132
    iget v0, v0, Ls1/m$a;->d:F

    .line 133
    .line 134
    const/4 v1, 0x0

    .line 135
    cmpl-float v0, v0, v1

    .line 136
    .line 137
    if-lez v0, :cond_a

    .line 138
    .line 139
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->o0()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_a

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 148
    .line 149
    check-cast v1, Landroid/content/Context;

    .line 150
    .line 151
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    sget-object v3, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 164
    .line 165
    const/4 v4, 0x0

    .line 166
    if-ne v1, v3, :cond_6

    .line 167
    .line 168
    move v2, v4

    .line 169
    :cond_6
    iput v2, v0, Ls1/m$a;->i:I

    .line 170
    .line 171
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 172
    .line 173
    iget-object v0, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 174
    .line 175
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 176
    .line 177
    .line 178
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->m0()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_7

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_7
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    :goto_2
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    int-to-float v1, v4

    .line 194
    int-to-float v2, v0

    .line 195
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 199
    .line 200
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 201
    .line 202
    check-cast v2, Landroid/content/Context;

    .line 203
    .line 204
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    iget v2, v2, Lcom/android/launcher3/r4;->V:F

    .line 213
    .line 214
    iput v2, v1, Ls1/m$a;->j:F

    .line 215
    .line 216
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 217
    .line 218
    iget v1, v1, Ls1/m$a;->d:F

    .line 219
    .line 220
    invoke-static {}, Lx1/O;->C3()Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-eqz v2, :cond_8

    .line 225
    .line 226
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-eqz v2, :cond_8

    .line 231
    .line 232
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 233
    .line 234
    iget v2, v2, Ls1/m$a;->d:F

    .line 235
    .line 236
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    int-to-float v3, v3

    .line 241
    mul-float/2addr v2, v3

    .line 242
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    invoke-static {v3}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    invoke-virtual {v3, v5}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-static {v3}, Lp1/f;->a(Lcom/android/launcher3/h0;)I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    int-to-float v3, v3

    .line 263
    div-float/2addr v2, v3

    .line 264
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 265
    .line 266
    float-to-double v5, v2

    .line 267
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 268
    .line 269
    .line 270
    move-result-wide v5

    .line 271
    double-to-float v2, v5

    .line 272
    iput v2, v3, Ls1/m$a;->d:F

    .line 273
    .line 274
    :cond_8
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 275
    .line 276
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    iget-object v5, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 281
    .line 282
    invoke-virtual {v2, v3, p1, v5}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 283
    .line 284
    .line 285
    invoke-static {}, Lx1/O;->C3()Z

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    if-eqz v2, :cond_9

    .line 290
    .line 291
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    if-eqz v2, :cond_9

    .line 296
    .line 297
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 298
    .line 299
    iput v1, p0, Ls1/m$a;->d:F

    .line 300
    .line 301
    :cond_9
    neg-int p0, v4

    .line 302
    int-to-float p0, p0

    .line 303
    neg-int v0, v0

    .line 304
    int-to-float v0, v0

    .line 305
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 306
    .line 307
    .line 308
    :cond_a
    return-void
.end method

.method public V0(Lcom/android/launcher3/BubbleTextView$f;Z)V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->K:Lcom/android/launcher3/BubbleTextView$f;

    .line 5
    .line 6
    invoke-virtual {p1, v3}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->K:Lcom/android/launcher3/BubbleTextView$f;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->J()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->K:Lcom/android/launcher3/BubbleTextView$f;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v3, 0x0

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    if-eq p1, v2, :cond_2

    .line 28
    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->M:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 35
    .line 36
    invoke-direct {p0, v3, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    throw p0

    .line 40
    :cond_2
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->L:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    move p1, v1

    .line 44
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->K:Lcom/android/launcher3/BubbleTextView$f;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_6

    .line 51
    .line 52
    if-eq v4, v2, :cond_5

    .line 53
    .line 54
    if-ne v4, v0, :cond_4

    .line 55
    .line 56
    const/high16 v3, 0x3f000000    # 0.5f

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_4
    new-instance p0, Ljava/lang/RuntimeException;

    .line 60
    .line 61
    invoke-direct {p0, v3, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_5
    const/high16 v3, 0x3f800000    # 1.0f

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_6
    const/4 v3, 0x0

    .line 69
    :goto_1
    if-nez p2, :cond_7

    .line 70
    .line 71
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 72
    .line 73
    iput v3, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_7
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object p2, p0, Lcom/android/launcher3/BubbleTextView;->Q:Landroid/animation/Animator;

    .line 85
    .line 86
    sget-object v4, Lcom/android/launcher3/BubbleTextView;->w0:Landroid/util/Property;

    .line 87
    .line 88
    filled-new-array {p1}, [I

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, v4, p1}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget-object v4, Lcom/android/launcher3/BubbleTextView;->x0:Landroid/util/Property;

    .line 97
    .line 98
    new-array v5, v2, [F

    .line 99
    .line 100
    aput v3, v5, v1

    .line 101
    .line 102
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    new-array v0, v0, [Landroid/animation/Animator;

    .line 107
    .line 108
    aput-object p1, v0, v1

    .line 109
    .line 110
    aput-object v3, v0, v2

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 113
    .line 114
    .line 115
    sget-object p1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    .line 119
    .line 120
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->P:I

    .line 121
    .line 122
    int-to-long p0, p0

    .line 123
    invoke-virtual {p2, p0, p1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 124
    .line 125
    .line 126
    const-wide/16 p0, 0x96

    .line 127
    .line 128
    invoke-virtual {p2, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public W(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    aget-object v0, v0, v1

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    sput-boolean v1, Lcom/android/launcher3/BubbleTextView;->y0:Z

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->V(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    sput-boolean p0, Lcom/android/launcher3/BubbleTextView;->y0:Z

    .line 21
    .line 22
    return-void
.end method

.method public W0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->a0:Z

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lt1/g;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/util/w;->e()V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, p0, v0}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method protected Y(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 24
    .line 25
    const v1, 0x3f6b851f    # 0.92f

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 32
    .line 33
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->H:I

    .line 36
    .line 37
    add-int/2addr v0, v1

    .line 38
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->F:I

    .line 39
    .line 40
    int-to-float v1, v1

    .line 41
    iget v2, p0, Lcom/android/launcher3/BubbleTextView;->O:F

    .line 42
    .line 43
    mul-float/2addr v1, v2

    .line 44
    iget v2, p0, Lcom/android/launcher3/BubbleTextView;->G:I

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    const/high16 v3, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float v9, v2, v3

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->I:Landroid/graphics/Paint;

    .line 52
    .line 53
    iget v4, p0, Lcom/android/launcher3/BubbleTextView;->N:I

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    int-to-float v2, v2

    .line 65
    div-float/2addr v1, v3

    .line 66
    sub-float v5, v2, v1

    .line 67
    .line 68
    int-to-float v6, v0

    .line 69
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->J:Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    int-to-float v2, v2

    .line 76
    add-float v7, v2, v1

    .line 77
    .line 78
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->G:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    int-to-float v8, v0

    .line 82
    iget-object v11, p0, Lcom/android/launcher3/BubbleTextView;->I:Landroid/graphics/Paint;

    .line 83
    .line 84
    move v10, v9

    .line 85
    move-object v4, p1

    .line 86
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method protected Z(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v0, v0, Lcom/android/launcher3/model/data/d;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    check-cast v0, Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    goto/16 :goto_2

    .line 60
    .line 61
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->n0()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 74
    .line 75
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 76
    .line 77
    if-nez v1, :cond_5

    .line 78
    .line 79
    iget-boolean v1, v0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 80
    .line 81
    if-nez v1, :cond_5

    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 84
    .line 85
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget v1, v1, Lcom/android/launcher3/X3;->t:I

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-ne v2, v1, :cond_4

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eq v2, v1, :cond_5

    .line 102
    .line 103
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    const-string v3, "drawUnOpenMark setPadding getText="

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v3, " paddingLeftRight="

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v3, " getPaddingLeft="

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v3, " getPaddingRight="

    .line 141
    .line 142
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    const-string v3, "BubbleTextView"

    .line 157
    .line 158
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    invoke-virtual {p0, v1, v2, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 170
    .line 171
    .line 172
    :cond_5
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 173
    .line 174
    if-nez v1, :cond_9

    .line 175
    .line 176
    iget-boolean v0, v0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 177
    .line 178
    if-nez v0, :cond_6

    .line 179
    .line 180
    goto/16 :goto_2

    .line 181
    .line 182
    :cond_6
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 191
    .line 192
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 193
    .line 194
    sub-float/2addr v1, v0

    .line 195
    const/high16 v0, 0x40000000    # 2.0f

    .line 196
    .line 197
    div-float/2addr v1, v0

    .line 198
    float-to-int v0, v1

    .line 199
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    const/4 v2, 0x0

    .line 204
    if-eqz v1, :cond_7

    .line 205
    .line 206
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v1, v2}, Landroid/text/Layout;->getLineWidth(I)F

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    float-to-int v1, v1

    .line 215
    goto :goto_0

    .line 216
    :cond_7
    move v1, v2

    .line 217
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    mul-int/lit8 v4, v4, 0x2

    .line 226
    .line 227
    sub-int/2addr v3, v4

    .line 228
    sub-int/2addr v3, v1

    .line 229
    div-int/lit8 v3, v3, 0x2

    .line 230
    .line 231
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollX()I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    invoke-virtual {p0}, Landroid/widget/TextView;->getScrollY()I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    int-to-float v5, v3

    .line 244
    int-to-float v6, v4

    .line 245
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    const v6, 0x7f070929

    .line 253
    .line 254
    .line 255
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    float-to-int v5, v5

    .line 260
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    .line 261
    .line 262
    .line 263
    move-result v6

    .line 264
    add-int/2addr v6, v0

    .line 265
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    add-int/2addr v0, v1

    .line 270
    sub-int/2addr v0, v5

    .line 271
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    invoke-virtual {v7}, Lcom/android/launcher3/resource/B;->s()Z

    .line 280
    .line 281
    .line 282
    move-result v7

    .line 283
    if-eqz v7, :cond_8

    .line 284
    .line 285
    const v7, 0x7f070928

    .line 286
    .line 287
    .line 288
    goto :goto_1

    .line 289
    :cond_8
    const v7, 0x7f070927

    .line 290
    .line 291
    .line 292
    :goto_1
    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimension(I)F

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    float-to-int v1, v1

    .line 297
    sub-int/2addr v0, v1

    .line 298
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    const v1, 0x7f080e0b

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    add-int v1, v0, v5

    .line 314
    .line 315
    add-int/2addr v5, v6

    .line 316
    invoke-virtual {p0, v0, v6, v1, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 320
    .line 321
    .line 322
    neg-int p0, v3

    .line 323
    int-to-float p0, p0

    .line 324
    neg-int v0, v4

    .line 325
    int-to-float v0, v0

    .line 326
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 327
    .line 328
    .line 329
    :cond_9
    :goto_2
    return-void
.end method

.method protected a0(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public cancelLongPress()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->q:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v1, v1, v0, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 19
    .line 20
    invoke-virtual {p0, p0, v0, p1}, Lcom/android/launcher3/BubbleTextView;->e0(Landroid/view/View;ILandroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public d0(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 2
    .line 3
    invoke-virtual {p0, p0, v0, p1}, Lcom/android/launcher3/BubbleTextView;->e0(Landroid/view/View;ILandroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {}, Lx1/O;->G1()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    instance-of v2, v2, Lcom/android/launcher3/model/data/z;

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 44
    .line 45
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/android/launcher3/model/data/z;

    .line 54
    .line 55
    invoke-direct {p0, v2, v3}, Lcom/android/launcher3/BubbleTextView;->z0(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v0, v1

    .line 60
    :cond_1
    :goto_0
    if-eqz v0, :cond_4

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->u1()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 77
    .line 78
    const/4 v2, 0x2

    .line 79
    if-ne v0, v2, :cond_2

    .line 80
    .line 81
    invoke-super {p0, p1}, Landroid/widget/TextView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l0:Lx1/v;

    .line 87
    .line 88
    if-nez v0, :cond_3

    .line 89
    .line 90
    new-instance v0, Lx1/v;

    .line 91
    .line 92
    const-string v2, "BubbleTextView"

    .line 93
    .line 94
    invoke-direct {v0, p0, v2, v1}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l0:Lx1/v;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/widget/TextView;->resetPivot()V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l0:Lx1/v;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    invoke-super {p0, p1}, Landroid/widget/TextView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    return p0
.end method

.method public e()Lcom/android/launcher3/util/a2;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->E0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lcom/android/launcher3/M;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/M;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public e0(Landroid/view/View;ILandroid/graphics/Rect;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p3, p1, p1, p2, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 3
    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->r:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sub-int/2addr p1, p2

    .line 14
    div-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->s:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sub-int/2addr v0, p2

    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    sub-int/2addr v0, p0

    .line 30
    invoke-virtual {p3, v0, p1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p3, p0, p1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    sub-int/2addr p1, p2

    .line 47
    div-int/lit8 p1, p1, 0x2

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {p3, p1, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public f0()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getNotificationCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public g(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 2
    .line 3
    invoke-virtual {p0, p0, v0, p1}, Lcom/android/launcher3/BubbleTextView;->e0(Landroid/view/View;ILandroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getDefaultIconSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    .line 2
    .line 3
    return p0
.end method

.method public getDownloadInstallDrawable()Lr1/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    instance-of v0, p0, Lr1/c;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lr1/c;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getDragonDrawable()Lcom/android/launcher3/iconarrange/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->i0:Lcom/android/launcher3/iconarrange/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderPreviewIconAnimator()Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->n0:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForceHideDot()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIcon()Ls1/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconDisplay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconRangeDelta()F
    .locals 0

    .line 1
    const p0, 0x3da3d70a    # 0.08f

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public getIconSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconStateDescription()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->K:Lcom/android/launcher3/BubbleTextView$f;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/BubbleTextView$f;->i:Lcom/android/launcher3/BubbleTextView$f;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->R:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v1, Lcom/android/launcher3/BubbleTextView$f;->h:Lcom/android/launcher3/BubbleTextView$f;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->S:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, ""

    .line 18
    .line 19
    return-object p0
.end method

.method public getParentTransformFolderIcon()Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;
    .locals 1

    .line 1
    const v0, 0x7f0b0628

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public getReorderBounceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->g:F

    .line 2
    .line 3
    return p0
.end method

.method public getTargetPackageName()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->k:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewType()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p1, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->W:Lcom/android/launcher3/util/w;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->a0:Z

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 16
    .line 17
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 20
    .line 21
    .line 22
    instance-of v0, p1, Lcom/android/launcher3/model/data/d;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->w(Lcom/android/launcher3/model/data/z;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 47
    .line 48
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->a0:Z

    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public i0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/BubbleTextView;->o0:Z

    .line 2
    .line 3
    return p0
.end method

.method public k0()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    iget v0, p0, Lcom/android/launcher3/model/data/I;->m:I

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->W()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/I;->W()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v0, 0x4

    .line 27
    if-ne p0, v0, :cond_1

    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public l0(Lcom/android/launcher3/model/data/z;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->E()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public n0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getParentTransformFolderIcon()Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public o0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->s0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method protected onCreateDrawableState(I)[I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/TextView;->onCreateDrawableState(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/BubbleTextView;->T:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/android/launcher3/BubbleTextView;->t0:[I

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroid/widget/TextView;->mergeDrawableStates([I[I)[I

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->X(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->Y(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->T(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->R(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->V(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 33
    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    .line 43
    .line 44
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 45
    .line 46
    sub-float/2addr v0, v1

    .line 47
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const v1, 0x3dcccccd    # 0.1f

    .line 52
    .line 53
    .line 54
    cmpg-float v0, v0, v1

    .line 55
    .line 56
    if-gez v0, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->Z(Landroid/graphics/Canvas;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lx1/O;->k1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-ne v0, v1, :cond_2

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const v0, 0x3f83d70a    # 1.03f

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    :goto_1
    invoke-virtual {p0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-wide/16 v1, 0x64

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-super {p0, p1, p2, p3}, Landroid/widget/TextView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const v1, 0x7f14009f

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/16 v1, 0x10

    .line 34
    .line 35
    invoke-direct {v0, v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->U:Z

    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p2, 0x0

    .line 9
    iput-boolean p2, p0, Lcom/android/launcher3/BubbleTextView;->U:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->refreshDrawableState()V

    .line 12
    .line 13
    .line 14
    return p1
.end method

.method protected onMeasure(II)V
    .locals 11

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->o:Z

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablePadding()I

    .line 18
    .line 19
    .line 20
    iget v2, v1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 21
    .line 22
    iget v3, v1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 23
    .line 24
    sub-float/2addr v2, v3

    .line 25
    float-to-double v2, v2

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    instance-of v4, v4, Lcom/android/launcher3/model/data/y;

    .line 46
    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 54
    .line 55
    iget v4, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 56
    .line 57
    if-nez v4, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    iget-boolean v2, v2, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 66
    .line 67
    if-eqz v2, :cond_0

    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 70
    .line 71
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget v2, v2, Lcom/android/launcher3/X3;->v:I

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 79
    .line 80
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget v2, v2, Lcom/android/launcher3/X3;->t:I

    .line 85
    .line 86
    :goto_0
    move v3, v2

    .line 87
    :cond_1
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/BubbleTextView;->O(Landroid/graphics/Paint$FontMetrics;I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-virtual {p0, v2, v1, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 96
    .line 97
    .line 98
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->N0()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const v2, 0x7f07011a

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const v3, 0x7f07011b

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    add-int/2addr v1, v2

    .line 127
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {p0, v1, v2, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 136
    .line 137
    .line 138
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->R0()Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    const/4 v2, 0x2

    .line 143
    const/4 v3, 0x0

    .line 144
    if-eqz v1, :cond_6

    .line 145
    .line 146
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->i:Ljava/lang/CharSequence;

    .line 147
    .line 148
    if-eqz v1, :cond_6

    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    sub-int/2addr v0, v1

    .line 155
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    sub-int/2addr v0, v1

    .line 160
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->n:Lcom/android/launcher3/h0;

    .line 161
    .line 162
    iget v4, v1, Lcom/android/launcher3/h0;->J2:I

    .line 163
    .line 164
    sub-int/2addr v0, v4

    .line 165
    iget v1, v1, Lcom/android/launcher3/h0;->K2:I

    .line 166
    .line 167
    sub-int v5, v0, v1

    .line 168
    .line 169
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    sub-int/2addr v0, v1

    .line 178
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    sub-int v4, v0, v1

    .line 183
    .line 184
    iget-object v6, p0, Lcom/android/launcher3/BubbleTextView;->i:Ljava/lang/CharSequence;

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    iget-object v8, p0, Lcom/android/launcher3/BubbleTextView;->h:Lcom/android/launcher3/util/x0;

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    .line 193
    .line 194
    .line 195
    move-result v9

    .line 196
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineSpacingExtra()F

    .line 197
    .line 198
    .line 199
    move-result v10

    .line 200
    invoke-static/range {v4 .. v10}, Lcom/android/launcher3/BubbleTextView;->y0(IILjava/lang/CharSequence;Landroid/text/TextPaint;Lcom/android/launcher3/util/x0;FF)Ljava/lang/CharSequence;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->j:Ljava/lang/CharSequence;

    .line 205
    .line 206
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_6

    .line 211
    .line 212
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->j:Ljava/lang/CharSequence;

    .line 213
    .line 214
    invoke-static {}, Lcom/android/launcher3/y0;->I0()Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_4

    .line 219
    .line 220
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    instance-of v4, v1, Lcom/android/launcher3/model/data/z;

    .line 225
    .line 226
    if-eqz v4, :cond_4

    .line 227
    .line 228
    check-cast v1, Lcom/android/launcher3/model/data/z;

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-eqz v1, :cond_4

    .line 235
    .line 236
    invoke-direct {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setTextWithArchivingIcon(Ljava/lang/CharSequence;)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_4
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    :goto_1
    sget-object v1, Lcom/android/launcher3/BubbleTextView;->r0:Ljava/lang/Character;

    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    invoke-static {v0, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;C)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    const/4 v1, -0x1

    .line 254
    if-eq v0, v1, :cond_5

    .line 255
    .line 256
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 260
    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_5
    const/4 v0, 0x1

    .line 264
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 268
    .line 269
    .line 270
    :cond_6
    :goto_2
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 271
    .line 272
    .line 273
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 274
    .line 275
    if-eqz v0, :cond_8

    .line 276
    .line 277
    instance-of v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;

    .line 278
    .line 279
    if-eqz v0, :cond_8

    .line 280
    .line 281
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 282
    .line 283
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    iget v0, v0, Lcom/android/launcher3/X3;->Z:I

    .line 288
    .line 289
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    const v5, 0x7f0703ee

    .line 298
    .line 299
    .line 300
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 301
    .line 302
    .line 303
    move-result v4

    .line 304
    add-int/2addr v1, v4

    .line 305
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 306
    .line 307
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    iget v4, v4, Lcom/android/launcher3/X3;->Z:I

    .line 312
    .line 313
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    invoke-virtual {p0, v0, v1, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 318
    .line 319
    .line 320
    invoke-static {}, Lm1/a;->b()Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    if-eqz v0, :cond_8

    .line 325
    .line 326
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->o0()Z

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    if-eqz v0, :cond_7

    .line 331
    .line 332
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 333
    .line 334
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    iget v0, v0, Lcom/android/launcher3/X3;->Z:I

    .line 339
    .line 340
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 341
    .line 342
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    iget v1, v1, Lcom/android/launcher3/X3;->Z:I

    .line 347
    .line 348
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 349
    .line 350
    .line 351
    move-result v4

    .line 352
    invoke-virtual {p0, v0, v3, v1, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 353
    .line 354
    .line 355
    goto :goto_3

    .line 356
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 357
    .line 358
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget v0, v0, Lcom/android/launcher3/X3;->Z:I

    .line 363
    .line 364
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    const v3, 0x7f0704bf

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    iget-object v3, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 376
    .line 377
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    iget v3, v3, Lcom/android/launcher3/X3;->Z:I

    .line 382
    .line 383
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingBottom()I

    .line 384
    .line 385
    .line 386
    move-result v4

    .line 387
    invoke-virtual {p0, v0, v1, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 388
    .line 389
    .line 390
    :cond_8
    :goto_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 391
    .line 392
    .line 393
    move-result v0

    .line 394
    if-eqz v0, :cond_a

    .line 395
    .line 396
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    if-eqz v0, :cond_a

    .line 401
    .line 402
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 403
    .line 404
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 405
    .line 406
    if-eqz v0, :cond_a

    .line 407
    .line 408
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 413
    .line 414
    .line 415
    move-result p2

    .line 416
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 417
    .line 418
    sub-int v0, p2, v0

    .line 419
    .line 420
    div-int/2addr v0, v2

    .line 421
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 426
    .line 427
    .line 428
    move-result v2

    .line 429
    invoke-virtual {p0, v1, v0, v2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 430
    .line 431
    .line 432
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 433
    .line 434
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->O1()I

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    const v1, 0x7f0b04c8

    .line 443
    .line 444
    .line 445
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    instance-of v2, v1, Ljava/lang/Integer;

    .line 450
    .line 451
    if-eqz v2, :cond_9

    .line 452
    .line 453
    check-cast v1, Ljava/lang/Integer;

    .line 454
    .line 455
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 456
    .line 457
    .line 458
    move-result v0

    .line 459
    :cond_9
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 460
    .line 461
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 462
    .line 463
    .line 464
    move-result-object v1

    .line 465
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 466
    .line 467
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    invoke-static {v2}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 472
    .line 473
    .line 474
    move-result v2

    .line 475
    invoke-static {v1, v2, v0}, Lp1/f;->j(Lcom/android/launcher3/C2;II)I

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 480
    .line 481
    if-eq v1, v0, :cond_a

    .line 482
    .line 483
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->K0(III)V

    .line 484
    .line 485
    .line 486
    :cond_a
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/BubbleTextView;->f0:Ljava/util/function/Consumer;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/BubbleTextView;->O0(FF)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->isLongClickable()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->q:Lcom/android/launcher3/V;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method

.method public onVisibilityAggregated(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onVisibilityAggregated(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public p0(FF)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->q0(FF)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    sub-int/2addr v1, v2

    .line 23
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconRangeDelta()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    mul-float/2addr v1, v2

    .line 33
    float-to-int v1, v1

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->r0()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    neg-int v1, v1

    .line 41
    :cond_1
    iget p0, v0, Landroid/graphics/Rect;->bottom:I

    .line 42
    .line 43
    add-int/2addr p0, v1

    .line 44
    int-to-float p0, p0

    .line 45
    cmpg-float p0, p2, p0

    .line 46
    .line 47
    if-gez p0, :cond_2

    .line 48
    .line 49
    iget p0, v0, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    sub-int/2addr p0, v1

    .line 52
    int-to-float p0, p0

    .line 53
    cmpl-float p0, p2, p0

    .line 54
    .line 55
    if-lez p0, :cond_2

    .line 56
    .line 57
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    add-int/2addr p0, v1

    .line 60
    int-to-float p0, p0

    .line 61
    cmpg-float p0, p1, p0

    .line 62
    .line 63
    if-gez p0, :cond_2

    .line 64
    .line 65
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 66
    .line 67
    sub-int/2addr p0, v1

    .line 68
    int-to-float p0, p0

    .line 69
    cmpl-float p0, p1, p0

    .line 70
    .line 71
    if-lez p0, :cond_2

    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_2
    const/4 p0, 0x0

    .line 76
    return p0
.end method

.method public q0(FF)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconRangeDelta()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    mul-float/2addr v1, v2

    .line 28
    float-to-int v1, v1

    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconRangeDelta()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    mul-float/2addr v2, p0

    .line 39
    float-to-int p0, v2

    .line 40
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 41
    .line 42
    add-int/2addr v2, p0

    .line 43
    int-to-float v2, v2

    .line 44
    cmpg-float v2, p2, v2

    .line 45
    .line 46
    if-gez v2, :cond_0

    .line 47
    .line 48
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    sub-int/2addr v2, p0

    .line 51
    int-to-float p0, v2

    .line 52
    cmpl-float p0, p2, p0

    .line 53
    .line 54
    if-lez p0, :cond_0

    .line 55
    .line 56
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    add-int/2addr p0, v1

    .line 59
    int-to-float p0, p0

    .line 60
    cmpg-float p0, p1, p0

    .line 61
    .line 62
    if-gez p0, :cond_0

    .line 63
    .line 64
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    sub-int/2addr p0, v1

    .line 67
    int-to-float p0, p0

    .line 68
    cmpl-float p0, p1, p0

    .line 69
    .line 70
    if-lez p0, :cond_0

    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0

    .line 74
    :cond_0
    return v3
.end method

.method public r0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/BubbleTextView;->e0:Z

    .line 2
    .line 3
    return p0
.end method

.method public refreshDrawableState()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->U:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/widget/TextView;->refreshDrawableState()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/widget/TextView;->requestLayout()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public varargs s([F)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->I()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/BubbleTextView;->u0:Landroid/util/Property;

    .line 5
    .line 6
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/BubbleTextView;->D:Landroid/animation/Animator;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/BubbleTextView$e;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/BubbleTextView$e;-><init>(Lcom/android/launcher3/BubbleTextView;[F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->D:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s0()Z
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const v1, 0x7f0b062b

    .line 24
    .line 25
    .line 26
    if-eq v0, v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const v0, 0x7f0b062c

    .line 39
    .line 40
    .line 41
    if-ne p0, v0, :cond_1

    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V
    .locals 0

    .line 1
    instance-of p0, p1, LO0/c;

    .line 2
    .line 3
    return-void
.end method

.method public setCenterVertically(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDisplay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    return-void
.end method

.method public setDragonDrawable(Lcom/android/launcher3/iconarrange/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->i0:Lcom/android/launcher3/iconarrange/a;

    .line 2
    .line 3
    return-void
.end method

.method public setFolderPreviewIconAnimator(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->n0:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method public setForceHideDot(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->E:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    new-array p1, p1, [F

    .line 22
    .line 23
    fill-array-data p1, :array_0

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->s([F)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setForceHideDownloadMark(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->q0:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->q0:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setHideBadge(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method protected setIcon(Ls1/o;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->t(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 9
    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/TextView;->getWindowVisibility()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/TextView;->isShown()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move v0, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v0, v2

    .line 29
    :goto_0
    invoke-virtual {p1, v0, v2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 33
    .line 34
    iget p0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 35
    .line 36
    const/4 v0, 0x5

    .line 37
    if-eq p0, v0, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move v1, v2

    .line 41
    :goto_1
    invoke-virtual {p1, v1}, Ls1/o;->r(Z)V

    .line 42
    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method public setIconBoundsScale(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    .line 2
    .line 3
    invoke-static {}, Lx1/O;->C3()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lp1/f;->x(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {v0, v1}, Lp1/f;->i(Lcom/android/launcher3/C2;I)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    :cond_0
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->m0:I

    .line 40
    .line 41
    int-to-float v2, v1

    .line 42
    int-to-float v1, v1

    .line 43
    mul-float/2addr v1, p1

    .line 44
    sub-float/2addr v2, v1

    .line 45
    const/high16 p1, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v2, p1

    .line 48
    float-to-int p1, v2

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sub-int/2addr v0, p1

    .line 54
    invoke-virtual {p0, p1, p1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public setIconDisabled(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ls1/o;->s(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setIconSize(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 8
    .line 9
    iput p1, v0, Ls1/m$a;->g:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U0(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public setIconVisible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->E0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getIconOrTransparentColor()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->t(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setIsAllAppRecommend(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->o0:Z

    .line 2
    .line 3
    return-void
.end method

.method protected setItemInfo(Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setLayoutHorizontal(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->r:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->r:Z

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getIconOrTransparentColor()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->t(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setLineIndicatorAnimStartDelay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->P:I

    .line 2
    .line 3
    return-void
.end method

.method public setLongPressTimeoutFactor(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/BubbleTextView;->q:Lcom/android/launcher3/V;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->j(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPrivateSpaceItem(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->h0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setReorderBounceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->g:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/TextView;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/TextView;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setShouldHideCheckbox(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->p0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSkipUserBadge(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStayPressed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->T:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->refreshDrawableState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/BubbleTextView;->y:Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getModifiedColor()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTextColor(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->h0:Z

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 3
    :cond_1
    iput p1, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/BubbleTextView;->y:Landroid/content/res/ColorStateList;

    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getModifiedColor()I

    move-result p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->d0:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->c0:Z

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 8
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->N0()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/android/launcher3/Y4;->j(Landroid/content/Context;)Lcom/android/launcher3/Y4;

    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/Y4;->i()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    goto :goto_1

    .line 12
    :cond_2
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/BubbleTextView;->x:I

    .line 13
    :goto_1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->z:F

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_3

    .line 14
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void

    .line 15
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getModifiedColor()I

    move-result p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setTextVisibility(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setTransformFolderIconLargeIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BubbleTextView;->e0:Z

    .line 2
    .line 3
    return-void
.end method

.method protected t(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_1
    move v0, v1

    .line 12
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->t:I

    .line 15
    .line 16
    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U0(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    instance-of v2, v0, Ls1/d0;

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    iget-boolean v2, p0, Lcom/android/launcher3/BubbleTextView;->a0:Z

    .line 31
    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    check-cast v0, Ls1/d0;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ls1/d0;->w(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iput-boolean v1, p0, Lcom/android/launcher3/BubbleTextView;->V:Z

    .line 40
    .line 41
    return-void
.end method

.method public u(Lcom/android/launcher3/model/data/y;Z)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v2, v2, Lcom/android/launcher3/X3;->c:Ls1/m;

    .line 10
    .line 11
    iput-object v2, p0, Lcom/android/launcher3/BubbleTextView;->B:Ls1/m;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/BubbleTextView;->m:Ls1/o;

    .line 14
    .line 15
    if-eqz v2, :cond_e

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getNotificationCount()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-lez v2, :cond_0

    .line 22
    .line 23
    move v3, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v3, v0

    .line 26
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->A:Lk1/a;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/launcher3/BubbleTextView;->l:Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {v5, p1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v4, v5}, Lk1/a;->g(Lk1/a;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->R0()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v4, v0

    .line 53
    :goto_1
    if-eqz v4, :cond_2

    .line 54
    .line 55
    move v5, v0

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->getNotificationCount()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    :goto_2
    if-eqz v4, :cond_3

    .line 62
    .line 63
    move v4, v0

    .line 64
    goto :goto_3

    .line 65
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/BubbleTextView;->A:Lk1/a;

    .line 66
    .line 67
    invoke-virtual {v4}, Lk1/a;->d()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    :goto_3
    iget-object v6, p0, Lcom/android/launcher3/BubbleTextView;->A:Lk1/a;

    .line 72
    .line 73
    invoke-virtual {v6, v4}, Lk1/a;->h(I)V

    .line 74
    .line 75
    .line 76
    if-lez v5, :cond_4

    .line 77
    .line 78
    move v4, v1

    .line 79
    goto :goto_4

    .line 80
    :cond_4
    move v4, v0

    .line 81
    :goto_4
    if-eqz v4, :cond_5

    .line 82
    .line 83
    const/high16 v6, 0x3f800000    # 1.0f

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_5
    const/4 v6, 0x0

    .line 87
    :goto_5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-static {v7}, Lcom/android/launcher3/nubia/c;->i(Landroid/content/ComponentName;)Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-nez v3, :cond_6

    .line 96
    .line 97
    if-nez v4, :cond_6

    .line 98
    .line 99
    if-eqz v7, :cond_a

    .line 100
    .line 101
    :cond_6
    if-nez v3, :cond_7

    .line 102
    .line 103
    if-eqz v4, :cond_8

    .line 104
    .line 105
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->i0()Z

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-nez v8, :cond_8

    .line 110
    .line 111
    instance-of v8, p0, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 112
    .line 113
    if-nez v8, :cond_8

    .line 114
    .line 115
    invoke-static {v2, v5, p1}, Lcom/android/launcher3/resource/u1;->E(IILcom/android/launcher3/model/data/y;)V

    .line 116
    .line 117
    .line 118
    :cond_8
    new-instance v8, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v9, "applyDotState: wasDotted: "

    .line 124
    .line 125
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v9, ", isDotted: "

    .line 132
    .line 133
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v9, ", "

    .line 140
    .line 141
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/widget/TextView;->isShown()Z

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v10, ", has push config: "

    .line 158
    .line 159
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v7, ", Suggest="

    .line 176
    .line 177
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    instance-of v7, p0, Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 181
    .line 182
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v7, ", dotCount="

    .line 186
    .line 187
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v2, ", newDotCount="

    .line 194
    .line 195
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    const-string v7, "BubbleTextView"

    .line 206
    .line 207
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    if-eqz p2, :cond_9

    .line 211
    .line 212
    if-nez v3, :cond_9

    .line 213
    .line 214
    if-eqz v4, :cond_9

    .line 215
    .line 216
    invoke-virtual {p0}, Landroid/widget/TextView;->isShown()Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-eqz p2, :cond_9

    .line 221
    .line 222
    new-array p2, v1, [F

    .line 223
    .line 224
    aput v6, p2, v0

    .line 225
    .line 226
    invoke-virtual {p0, p2}, Lcom/android/launcher3/BubbleTextView;->s([F)V

    .line 227
    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_9
    invoke-direct {p0}, Lcom/android/launcher3/BubbleTextView;->I()V

    .line 231
    .line 232
    .line 233
    iget-object p2, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 234
    .line 235
    iput v6, p2, Ls1/m$a;->d:F

    .line 236
    .line 237
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 238
    .line 239
    .line 240
    :cond_a
    :goto_6
    iget-object p2, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 241
    .line 242
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    if-nez p2, :cond_e

    .line 247
    .line 248
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    if-eqz p2, :cond_b

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 259
    .line 260
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    const v0, 0x7f140191

    .line 265
    .line 266
    .line 267
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_b
    instance-of p2, p1, Lcom/android/launcher3/model/data/I;

    .line 276
    .line 277
    if-eqz p2, :cond_c

    .line 278
    .line 279
    move-object p2, p1

    .line 280
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 281
    .line 282
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    if-eqz p2, :cond_c

    .line 287
    .line 288
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 293
    .line 294
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    const v0, 0x7f14008a

    .line 299
    .line 300
    .line 301
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :cond_c
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    if-eqz p2, :cond_d

    .line 314
    .line 315
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 316
    .line 317
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    invoke-direct {p0, p1, v5}, Lcom/android/launcher3/BubbleTextView;->c0(Ljava/lang/String;I)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :cond_d
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 330
    .line 331
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    :cond_e
    return-void
.end method

.method public v(Lcom/android/launcher3/model/data/d;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->A(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setItemInfo(Lcom/android/launcher3/model/data/z;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->J0(Lcom/android/launcher3/model/data/z;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public v0()Ln1/r;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/launcher3/BubbleTextView;->w0(Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public w(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->A(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setItemInfo(Lcom/android/launcher3/model/data/z;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->J0(Lcom/android/launcher3/model/data/z;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->W()I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Lcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->A(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setItemInfo(Lcom/android/launcher3/model/data/z;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->y()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/BubbleTextView;->J0(Lcom/android/launcher3/model/data/z;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->x(Lcom/android/launcher3/model/data/I;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public z(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->t(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
