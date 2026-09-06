.class public Lcom/zte/mifavor/widget/TimePickerZTE;
.super Landroid/widget/FrameLayout;
.source "TimePickerZTE.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/TimePickerZTE$f;,
        Lcom/zte/mifavor/widget/TimePickerZTE$g;
    }
.end annotation


# static fields
.field private static final D:Lcom/zte/mifavor/widget/TimePickerZTE$f;


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private final g:Landroid/widget/LinearLayout;

.field private final h:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final i:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final j:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final k:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final l:Landroid/widget/EditText;

.field private final m:Landroid/widget/EditText;

.field private final n:Landroid/widget/EditText;

.field private final o:Landroid/widget/Button;

.field private final p:[Ljava/lang/String;

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Lcom/zte/mifavor/widget/TimePickerZTE$f;

.field private u:Ljava/util/Calendar;

.field private v:Ljava/util/Locale;

.field private w:Z

.field private x:C

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/TimePickerZTE$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/mifavor/widget/TimePickerZTE$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/mifavor/widget/TimePickerZTE;->D:Lcom/zte/mifavor/widget/TimePickerZTE$f;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 3
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->s:Z

    const p3, 0x8ed3

    .line 4
    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    const/high16 p3, -0x76000000

    .line 5
    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    const/high16 p3, 0x42000000    # 32.0f

    .line 6
    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->A:I

    const/16 p3, 0x14

    .line 7
    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    const/16 p3, 0x10

    .line 8
    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    .line 9
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-direct {p0, p3}, Lcom/zte/mifavor/widget/TimePickerZTE;->setCurrentLocale(Ljava/util/Locale;)V

    .line 10
    sget p3, LR3/i;->t:I

    .line 11
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 12
    invoke-virtual {v0, p3, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    invoke-static {p1}, Lb4/g;->h(Landroid/content/Context;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/e;->g:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    int-to-float p3, p3

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr p3, v0

    float-to-int p3, p3

    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/e;->h:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    int-to-float p3, p3

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr p3, v0

    float-to-int p3, p3

    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    .line 18
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "TimePickerZTE dp mInputSize="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", mSelectorSize="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "TimePickerZTE"

    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/d;->i:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/d;->m:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/d;->t:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->A:I

    .line 22
    sget p3, LR3/g;->y0:I

    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 23
    sget v0, LR3/g;->D:I

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 25
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 26
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->A:I

    iget v2, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    iget v3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k0(III)V

    .line 27
    new-instance v1, Lcom/zte/mifavor/widget/TimePickerZTE$b;

    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/TimePickerZTE$b;-><init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 28
    sget v1, LR3/g;->R:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->l:Landroid/widget/EditText;

    const/4 v2, 0x5

    .line 29
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 30
    sget v0, LR3/g;->w:I

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 32
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 33
    const-string v4, ":"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    .line 34
    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 35
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 36
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getInputText()Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 37
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 38
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    iget v5, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    invoke-virtual {v0, v4, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 39
    sget v0, LR3/g;->O:I

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 40
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 41
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 42
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->A:I

    iget v5, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    iget v6, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    invoke-virtual {v0, v4, v5, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k0(III)V

    .line 43
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    const/16 v4, 0x3b

    .line 44
    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    const-wide/16 v4, 0x64

    .line 45
    invoke-virtual {v0, v4, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnLongPressUpdateInterval(J)V

    .line 46
    invoke-static {}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getTwoDigitFormatter()Lcom/zte/mifavor/widget/NumberPickerZTE$g;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setFormatter(Lcom/zte/mifavor/widget/NumberPickerZTE$g;)V

    .line 47
    new-instance v4, Lcom/zte/mifavor/widget/TimePickerZTE$c;

    invoke-direct {v4, p0}, Lcom/zte/mifavor/widget/TimePickerZTE$c;-><init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    invoke-virtual {v0, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setImeOptions(I)V

    const/4 v0, 0x2

    .line 50
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->p:[Ljava/lang/String;

    .line 51
    sget v2, LR3/k;->a:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v3

    .line 52
    sget v2, LR3/k;->h:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, p2

    .line 53
    sget p1, LR3/g;->b:I

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 54
    instance-of v2, p1, Landroid/widget/Button;

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    .line 55
    iput-object v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 56
    iput-object v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 57
    move-object v0, p1

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 58
    new-instance v1, Lcom/zte/mifavor/widget/TimePickerZTE$d;

    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/TimePickerZTE$d;-><init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 59
    :cond_1
    iput-object v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 60
    move-object v2, p1

    check-cast v2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object v2, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 61
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->B:I

    invoke-virtual {v2, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 62
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->C:I

    invoke-virtual {v2, v4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 63
    iget v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    iget v5, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->y:I

    invoke-virtual {v2, v4, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 64
    invoke-virtual {v2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 65
    invoke-virtual {v2, p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 66
    invoke-virtual {v2, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 67
    new-instance v0, Lcom/zte/mifavor/widget/TimePickerZTE$e;

    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/TimePickerZTE$e;-><init>(Lcom/zte/mifavor/widget/TimePickerZTE;)V

    invoke-virtual {v2, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 68
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    const/4 v1, 0x6

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 70
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->i()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 71
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    .line 72
    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 73
    invoke-virtual {p3, p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 75
    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result p3

    .line 76
    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v0

    if-eq p3, v0, :cond_2

    .line 77
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 78
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 79
    :cond_2
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourFormatData()V

    .line 80
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->n()V

    .line 81
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->p()V

    .line 82
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->m()V

    .line 83
    sget-object p1, Lcom/zte/mifavor/widget/TimePickerZTE;->D:Lcom/zte/mifavor/widget/TimePickerZTE$f;

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setOnTimeChangedListener(Lcom/zte/mifavor/widget/TimePickerZTE$f;)V

    .line 84
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    const/16 p3, 0xb

    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setHourMFV(I)V

    .line 85
    iget-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    const/16 p3, 0xc

    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setMinuteMFV(I)V

    .line 86
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_3

    .line 87
    invoke-virtual {p0, v3}, Lcom/zte/mifavor/widget/TimePickerZTE;->setEnabled(Z)V

    .line 88
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getImportantForAccessibility()I

    move-result p1

    if-nez p1, :cond_4

    .line 89
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    :cond_4
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/TimePickerZTE;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/TimePickerZTE;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/TimePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/TimePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/TimePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getHourFormatData()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "Hm"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "hm"

    .line 13
    .line 14
    :goto_0
    invoke-static {v0, v1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->w:Z

    .line 24
    .line 25
    :goto_1
    if-ge v2, v1, :cond_3

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/16 v4, 0x48

    .line 32
    .line 33
    if-eq v3, v4, :cond_2

    .line 34
    .line 35
    const/16 v4, 0x68

    .line 36
    .line 37
    if-eq v3, v4, :cond_2

    .line 38
    .line 39
    const/16 v4, 0x4b

    .line 40
    .line 41
    if-eq v3, v4, :cond_2

    .line 42
    .line 43
    const/16 v4, 0x6b

    .line 44
    .line 45
    if-ne v3, v4, :cond_1

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    :goto_2
    iput-char v3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->x:C

    .line 52
    .line 53
    const/4 v4, 0x1

    .line 54
    add-int/2addr v2, v4

    .line 55
    if-ge v2, v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ne v3, v0, :cond_3

    .line 62
    .line 63
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->w:Z

    .line 64
    .line 65
    :cond_3
    return-void
.end method

.method private i()Z
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "hm"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "a"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method private j()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/zte/mifavor/widget/NumberPickerZTE;->y0:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->t:Lcom/zte/mifavor/widget/TimePickerZTE$f;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourMFV()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getMinuteMFV()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-interface {v0, p0, v1, v2}, Lcom/zte/mifavor/widget/TimePickerZTE$f;->a(Lcom/zte/mifavor/widget/TimePickerZTE;II)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private m()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 24
    .line 25
    xor-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->i()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 54
    .line 55
    const/4 v1, 0x6

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->p:[Ljava/lang/String;

    .line 63
    .line 64
    aget-object v0, v3, v0

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    :goto_0
    const/4 v0, 0x4

    .line 75
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private n()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-char v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->x:C

    .line 10
    .line 11
    const/16 v3, 0x6b

    .line 12
    .line 13
    if-ne v0, v3, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 21
    .line 22
    const/16 v1, 0x18

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 34
    .line 35
    const/16 v1, 0x17

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-char v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->x:C

    .line 42
    .line 43
    const/16 v3, 0x4b

    .line 44
    .line 45
    if-ne v0, v3, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 53
    .line 54
    const/16 v1, 0xb

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 66
    .line 67
    const/16 v1, 0xc

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 70
    .line 71
    .line 72
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 73
    .line 74
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->w:Z

    .line 75
    .line 76
    if-eqz p0, :cond_3

    .line 77
    .line 78
    invoke-static {}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getTwoDigitFormatter()Lcom/zte/mifavor/widget/NumberPickerZTE$g;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    const/4 p0, 0x0

    .line 84
    :goto_1
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setFormatter(Lcom/zte/mifavor/widget/NumberPickerZTE$g;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private o()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "input_method"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->l:Landroid/widget/EditText;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->l:Landroid/widget/EditText;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method private p()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x6

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->i()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 27
    .line 28
    const/4 v0, 0x5

    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private setCurrentLocale(Ljava/util/Locale;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->v:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->v:Ljava/util/Locale;

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getAmView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBaseline()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBaseline()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentHour()Ljava/lang/Integer;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    rem-int/lit8 v0, v0, 0xc

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    rem-int/lit8 v0, v0, 0xc

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0xc

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public getCurrentMinute()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getHour()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    rem-int/lit8 v0, v0, 0xc

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    rem-int/lit8 v0, v0, 0xc

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0xc

    .line 24
    .line 25
    return v0
.end method

.method public getHourMFV()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHour()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getHourView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->l:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinute()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMinuteMFV()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getMinute()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getMinuteView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->m:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPmView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->n:Landroid/widget/EditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimePickerContainer()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public k(Ljava/lang/Integer;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getCurrentHour()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->g()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v1, 0xc

    .line 25
    .line 26
    if-lt v0, v1, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-le v0, v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    sub-int/2addr p1, v1

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->r:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->m()V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 70
    .line 71
    .line 72
    if-eqz p2, :cond_4

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->j()V

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_1
    return-void
.end method

.method public l(Ljava/lang/Integer;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getCurrentMinute()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 19
    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->j()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setCurrentLocale(Ljava/util/Locale;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const-class p0, Lcom/zte/mifavor/widget/TimePickerZTE;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x81

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/16 v0, 0x41

    .line 12
    .line 13
    :goto_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    .line 14
    .line 15
    const/16 v2, 0xb

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourMFV()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    .line 25
    .line 26
    const/16 v2, 0xc

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getMinuteMFV()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->u:Ljava/util/Calendar;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    invoke-static {v1, v2, v3, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/zte/mifavor/widget/TimePickerZTE$g;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/TimePickerZTE$g;->a()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->setHourMFV(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/TimePickerZTE$g;->b()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setMinuteMFV(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/zte/mifavor/widget/TimePickerZTE$g;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourMFV()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getMinuteMFV()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->g()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-direct {v1, v0, v2, v3, p0}, Lcom/zte/mifavor/widget/TimePickerZTE$g;-><init>(Landroid/os/Parcelable;IIZ)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public setColor(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    iget v1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 23
    .line 24
    iget p0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->z:I

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setCurrentHour(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->k(Ljava/lang/Integer;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setCurrentMinute(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->l(Ljava/lang/Integer;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->s:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->o:Landroid/widget/Button;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->s:Z

    .line 40
    .line 41
    return-void
.end method

.method public setHour(I)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->k(Ljava/lang/Integer;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHourMFV(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setHour(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setIs24Hour(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHour()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourFormatData()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->n()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, v0}, Lcom/zte/mifavor/widget/TimePickerZTE;->k(Ljava/lang/Integer;Z)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->p()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->m()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setIs24HourView(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getCurrentHour()Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->q:Z

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getHourFormatData()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->n()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->k(Ljava/lang/Integer;Z)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->p()V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->m()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setMinute(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->getMinute()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/zte/mifavor/widget/TimePickerZTE;->j()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setMinuteMFV(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/TimePickerZTE;->setMinute(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setOnTimeChangedListener(Lcom/zte/mifavor/widget/TimePickerZTE$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/TimePickerZTE;->t:Lcom/zte/mifavor/widget/TimePickerZTE$f;

    .line 2
    .line 3
    return-void
.end method
