.class public final Lcom/android/quickstep/views/TaskThumbnailViewHeader;
.super Landroid/widget/FrameLayout;
.source "TaskThumbnailViewHeader.kt"


# instance fields
.field private final headerCloseButton$delegate:Lh4/e;

.field private final headerIconView$delegate:Lh4/e;

.field private final headerTitleView$delegate:Lh4/e;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    new-instance p1, Lcom/android/quickstep/views/Z1;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/Z1;-><init>(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerTitleView$delegate:Lh4/e;

    .line 5
    new-instance p1, Lcom/android/quickstep/views/a2;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/a2;-><init>(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerIconView$delegate:Lh4/e;

    .line 6
    new-instance p1, Lcom/android/quickstep/views/b2;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/b2;-><init>(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)V

    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerCloseButton$delegate:Lh4/e;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageButton;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerCloseButton_delegate$lambda$2(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/TextView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerTitleView_delegate$lambda$0(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerIconView_delegate$lambda$1(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final getHeaderCloseButton()Landroid/widget/ImageButton;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerCloseButton$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/ImageButton;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getHeaderIconView()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerIconView$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/ImageView;

    .line 13
    .line 14
    return-object p0
.end method

.method private final getHeaderTitleView()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->headerTitleView$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getValue(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/widget/TextView;

    .line 13
    .line 14
    return-object p0
.end method

.method private static final headerCloseButton_delegate$lambda$2(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageButton;
    .locals 1

    .line 1
    const v0, 0x7f0b02cc

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/ImageButton;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final headerIconView_delegate$lambda$1(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/ImageView;
    .locals 1

    .line 1
    const v0, 0x7f0b02ca

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/ImageView;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final headerTitleView_delegate$lambda$0(Lcom/android/quickstep/views/TaskThumbnailViewHeader;)Landroid/widget/TextView;
    .locals 1

    .line 1
    const v0, 0x7f0b02cb

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/TextView;

    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public final setHeader(Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;)V
    .locals 2

    .line 1
    const-string v0, "header"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->getHeaderTitleView()Landroid/widget/TextView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;->getTitle()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->getHeaderIconView()Landroid/widget/ImageView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/quickstep/views/TaskThumbnailViewHeader;->getHeaderCloseButton()Landroid/widget/ImageButton;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$ThumbnailHeader;->getClickCloseListener()Landroid/view/View$OnClickListener;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
