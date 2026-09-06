.class public Lcom/zte/mifavor/widget/DatePickerZTE;
.super Landroid/widget/FrameLayout;
.source "DatePickerZTE.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/DatePickerZTE$b;,
        Lcom/zte/mifavor/widget/DatePickerZTE$c;
    }
.end annotation


# instance fields
.field private A:I

.field private final g:Landroid/widget/LinearLayout;

.field private final h:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final i:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final j:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private final k:Landroid/widget/EditText;

.field private final l:Landroid/widget/EditText;

.field private final m:Landroid/widget/EditText;

.field private final n:Ljava/text/DateFormat;

.field private o:Ljava/util/Locale;

.field private p:[Ljava/lang/String;

.field private q:I

.field private r:Ljava/util/Calendar;

.field private s:Ljava/util/Calendar;

.field private t:Ljava/util/Calendar;

.field private u:Ljava/util/Calendar;

.field private v:Z

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget v0, LR3/c;->e:I

    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/DatePickerZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM/dd/yyyy"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->n:Ljava/text/DateFormat;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->v:Z

    const v1, 0x8ed3

    .line 5
    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->w:I

    const/high16 v1, -0x76000000

    .line 6
    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    const/high16 v1, 0x42000000    # 32.0f

    .line 7
    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->y:I

    const/16 v1, 0x14

    .line 8
    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    const/16 v1, 0x10

    .line 9
    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/zte/mifavor/widget/DatePickerZTE;->setCurrentLocale(Ljava/util/Locale;)V

    .line 11
    invoke-static {p1}, Lb4/g;->h(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, LR3/e;->g:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, LR3/e;->h:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DatePickerZTE dp mInputSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mSelectorSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "DatePickerZTE"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    :cond_0
    sget-object v1, LR3/m;->O0:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 18
    sget p3, LR3/m;->S0:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 19
    sget v1, LR3/m;->T0:I

    const/16 v3, 0x76c

    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 20
    sget v3, LR3/m;->P0:I

    const/16 v4, 0x834

    invoke-virtual {p2, v3, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 21
    sget v4, LR3/m;->R0:I

    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 22
    sget v5, LR3/m;->Q0:I

    invoke-virtual {p2, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 23
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    sget p2, LR3/i;->f:I

    .line 25
    const-string v6, "layout_inflater"

    .line 26
    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    .line 27
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    new-instance p1, Lcom/zte/mifavor/widget/DatePickerZTE$a;

    invoke-direct {p1, p0}, Lcom/zte/mifavor/widget/DatePickerZTE$a;-><init>(Lcom/zte/mifavor/widget/DatePickerZTE;)V

    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v6, LR3/d;->i:I

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->w:I

    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v6, LR3/d;->m:I

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v6, LR3/d;->t:I

    invoke-virtual {p2, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->y:I

    .line 32
    sget p2, LR3/g;->Z:I

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 33
    sget p2, LR3/g;->t:I

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 34
    iget v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    invoke-virtual {p2, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 35
    iget v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    invoke-virtual {p2, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 36
    iget v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->y:I

    iget v7, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->w:I

    iget v8, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    invoke-virtual {p2, v6, v7, v8}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k0(III)V

    const-wide/16 v6, 0x64

    .line 37
    invoke-virtual {p2, v6, v7}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnLongPressUpdateInterval(J)V

    .line 38
    invoke-virtual {p2, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 39
    sget v8, LR3/g;->R:I

    invoke-virtual {p2, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->k:Landroid/widget/EditText;

    .line 40
    sget p2, LR3/g;->P:I

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 42
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 43
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->y:I

    iget v10, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->w:I

    iget v11, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    invoke-virtual {p2, v9, v10, v11}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k0(III)V

    .line 44
    invoke-virtual {p2, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 45
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->q:I

    sub-int/2addr v9, v0

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 46
    iget-object v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    const-wide/16 v9, 0xc8

    .line 47
    invoke-virtual {p2, v9, v10}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnLongPressUpdateInterval(J)V

    .line 48
    invoke-virtual {p2, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 49
    invoke-virtual {p2, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->l:Landroid/widget/EditText;

    .line 50
    sget p2, LR3/g;->H0:I

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 51
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->z:I

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 52
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->A:I

    invoke-virtual {p2, v9}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 53
    iget v9, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->y:I

    iget v10, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->w:I

    iget v11, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    invoke-virtual {p2, v9, v10, v11}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k0(III)V

    .line 54
    invoke-virtual {p2, v6, v7}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnLongPressUpdateInterval(J)V

    .line 55
    invoke-virtual {p2, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 56
    invoke-virtual {p2, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->m:Landroid/widget/EditText;

    if-nez p3, :cond_1

    .line 57
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/DatePickerZTE;->setSpinnersShown(Z)V

    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p0, p3}, Lcom/zte/mifavor/widget/DatePickerZTE;->setSpinnersShown(Z)V

    .line 59
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->clear()V

    .line 60
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 61
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-direct {p0, v4, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->m(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 62
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2, v0}, Ljava/util/Calendar;->set(III)V

    goto :goto_1

    .line 63
    :cond_2
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1, v1, v2, v0}, Ljava/util/Calendar;->set(III)V

    .line 64
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/zte/mifavor/widget/DatePickerZTE;->setMinDate(J)V

    .line 65
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->clear()V

    .line 66
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const/16 p2, 0x1f

    const/16 p3, 0xb

    if-nez p1, :cond_4

    .line 67
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-direct {p0, v5, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->m(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 68
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1, v3, p3, p2}, Ljava/util/Calendar;->set(III)V

    goto :goto_2

    .line 69
    :cond_4
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1, v3, p3, p2}, Ljava/util/Calendar;->set(III)V

    .line 70
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/zte/mifavor/widget/DatePickerZTE;->setMaxDate(J)V

    .line 71
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 72
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    const/4 p3, 0x2

    invoke-virtual {p2, p3}, Ljava/util/Calendar;->get(I)I

    move-result p2

    iget-object p3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    const/4 v1, 0x5

    .line 73
    invoke-virtual {p3, v1}, Ljava/util/Calendar;->get(I)I

    move-result p3

    const/4 v1, 0x0

    .line 74
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/zte/mifavor/widget/DatePickerZTE;->k(IIILcom/zte/mifavor/widget/DatePickerZTE$b;)V

    .line 75
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->n()V

    .line 76
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->o()V

    .line 77
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getImportantForAccessibility()I

    move-result p1

    if-nez p1, :cond_6

    .line 78
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    :cond_6
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/DatePickerZTE;)Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/DatePickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/DatePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/DatePickerZTE;III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/DatePickerZTE;->p(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/DatePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/DatePickerZTE;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 17
    .line 18
    .line 19
    return-object p2
.end method

.method private l()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private m(Ljava/lang/String;Ljava/util/Calendar;)Z
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->n:Ljava/text/DateFormat;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-virtual {p0}, Ljava/text/ParseException;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private n()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/format/DateFormat;->getDateFormatOrder(Landroid/content/Context;)[C

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_3

    .line 17
    .line 18
    aget-char v3, v0, v2

    .line 19
    .line 20
    const/16 v4, 0x4d

    .line 21
    .line 22
    if-eq v3, v4, :cond_2

    .line 23
    .line 24
    const/16 v4, 0x64

    .line 25
    .line 26
    if-eq v3, v4, :cond_1

    .line 27
    .line 28
    const/16 v4, 0x79

    .line 29
    .line 30
    if-ne v3, v4, :cond_0

    .line 31
    .line 32
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 40
    .line 41
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/DatePickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 46
    .line 47
    invoke-static {v0}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :cond_1
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 63
    .line 64
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/DatePickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 76
    .line 77
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/DatePickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

    .line 78
    .line 79
    .line 80
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    return-void
.end method

.method private o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    sget v1, LR3/g;->F:I

    .line 4
    .line 5
    sget v2, LR3/k;->e:I

    .line 6
    .line 7
    invoke-direct {p0, v0, v1, v2}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 11
    .line 12
    sget v2, LR3/g;->u:I

    .line 13
    .line 14
    sget v3, LR3/k;->b:I

    .line 15
    .line 16
    invoke-direct {p0, v0, v2, v3}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 20
    .line 21
    sget v3, LR3/k;->f:I

    .line 22
    .line 23
    invoke-direct {p0, v0, v1, v3}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 27
    .line 28
    sget v3, LR3/k;->c:I

    .line 29
    .line 30
    invoke-direct {p0, v0, v2, v3}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 34
    .line 35
    sget v3, LR3/k;->g:I

    .line 36
    .line 37
    invoke-direct {p0, v0, v1, v3}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    .line 42
    sget v1, LR3/k;->d:I

    .line 43
    .line 44
    invoke-direct {p0, v0, v2, v1}, Lcom/zte/mifavor/widget/DatePickerZTE;->r(Landroid/view/View;II)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private p(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ljava/util/Calendar;->set(III)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 7
    .line 8
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide p2

    .line 24
    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide p2

    .line 46
    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method private q(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V
    .locals 0

    .line 1
    add-int/lit8 p2, p2, -0x1

    .line 2
    .line 3
    if-ge p3, p2, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x5

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x6

    .line 8
    :goto_0
    sget p2, LR3/g;->R:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private r(Landroid/view/View;II)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private s()V
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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->m:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->m:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->l:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->l:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->k:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->k:Landroid/widget/EditText;

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

.method private setCurrentLocale(Ljava/util/Locale;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->o:Ljava/util/Locale;

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
    goto :goto_1

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->o:Ljava/util/Locale;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 13
    .line 14
    invoke-direct {p0, v0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->j(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 21
    .line 22
    invoke-direct {p0, v0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->j(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 29
    .line 30
    invoke-direct {p0, v0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->j(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 37
    .line 38
    invoke-direct {p0, v0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->j(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 43
    .line 44
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    iput p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->q:I

    .line 54
    .line 55
    new-instance p1, Ljava/text/DateFormatSymbols;

    .line 56
    .line 57
    invoke-direct {p1}, Ljava/text/DateFormatSymbols;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->u()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    iget p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->q:I

    .line 73
    .line 74
    new-array p1, p1, [Ljava/lang/String;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    :goto_0
    iget v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->q:I

    .line 80
    .line 81
    if-ge p1, v0, :cond_1

    .line 82
    .line 83
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    add-int/lit8 v2, p1, 0x1

    .line 90
    .line 91
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    const-string v4, "%d"

    .line 100
    .line 101
    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    aput-object v1, v0, p1

    .line 106
    .line 107
    move p1, v2

    .line 108
    goto :goto_0

    .line 109
    :cond_1
    :goto_1
    return-void
.end method

.method private t()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x2

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x5

    .line 13
    const/4 v5, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 17
    .line 18
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 19
    .line 20
    invoke-virtual {v6, v4}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    invoke-virtual {v0, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 28
    .line 29
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 30
    .line 31
    invoke-virtual {v6, v4}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    invoke-virtual {v0, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 77
    .line 78
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 79
    .line 80
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 87
    .line 88
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 89
    .line 90
    invoke-virtual {v6, v4}, Ljava/util/Calendar;->getActualMinimum(I)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-virtual {v0, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 98
    .line 99
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 100
    .line 101
    invoke-virtual {v6, v4}, Ljava/util/Calendar;->get(I)I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    invoke-virtual {v0, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 109
    .line 110
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->getActualMinimum(I)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 130
    .line 131
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 141
    .line 142
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 147
    .line 148
    invoke-virtual {v0, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 152
    .line 153
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 154
    .line 155
    invoke-virtual {v6, v4}, Ljava/util/Calendar;->getActualMaximum(I)I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    invoke-virtual {v0, v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 163
    .line 164
    invoke-virtual {v0, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 173
    .line 174
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 178
    .line 179
    const/16 v1, 0xb

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 185
    .line 186
    invoke-virtual {v0, v5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 187
    .line 188
    .line 189
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMinValue()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    iget-object v6, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 198
    .line 199
    invoke-virtual {v6}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMaxValue()I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    add-int/2addr v6, v5

    .line 204
    invoke-static {v0, v1, v6}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    check-cast v0, [Ljava/lang/String;

    .line 209
    .line 210
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 211
    .line 212
    invoke-virtual {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 216
    .line 217
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 218
    .line 219
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 227
    .line 228
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 229
    .line 230
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 238
    .line 239
    invoke-virtual {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 243
    .line 244
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 245
    .line 246
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 254
    .line 255
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 265
    .line 266
    iget-object v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 267
    .line 268
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 273
    .line 274
    .line 275
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->u()Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-eqz v0, :cond_2

    .line 280
    .line 281
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->l:Landroid/widget/EditText;

    .line 282
    .line 283
    invoke-virtual {p0, v2}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 284
    .line 285
    .line 286
    :cond_2
    return-void
.end method

.method private u()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->p:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p0, p0, v0

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->dispatchThawSelfOnly(Landroid/util/SparseArray;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getDayOfMonth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getMonth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public getSpinnersShown()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isShown()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getYear()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public k(IIILcom/zte/mifavor/widget/DatePickerZTE$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/DatePickerZTE;->p(III)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->t()V

    .line 5
    .line 6
    .line 7
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
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->setCurrentLocale(Ljava/util/Locale;)V

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
    const-class p0, Lcom/zte/mifavor/widget/DatePickerZTE;

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
    const-class p0, Lcom/zte/mifavor/widget/DatePickerZTE;

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
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    const/16 p0, 0x14

    .line 13
    .line 14
    invoke-static {v0, v1, v2, p0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/zte/mifavor/widget/DatePickerZTE$c;

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
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/DatePickerZTE$c;->e()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/DatePickerZTE$c;->b()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/DatePickerZTE$c;->a()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-direct {p0, v0, v1, p1}, Lcom/zte/mifavor/widget/DatePickerZTE;->p(III)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->t()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    new-instance v0, Lcom/zte/mifavor/widget/DatePickerZTE$c;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->getYear()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->getMonth()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->getDayOfMonth()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/DatePickerZTE$c;-><init>(Landroid/os/Parcelable;IIILcom/zte/mifavor/widget/f;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public setColor(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    iget v1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    iget p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->x:I

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->v:Z

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
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setEnabled(Z)V

    .line 22
    .line 23
    .line 24
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->v:Z

    .line 25
    .line 26
    return-void
.end method

.method public setInputSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setMaxDate(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 22
    .line 23
    const/4 v1, 0x6

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eq v0, v1, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 53
    .line 54
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->t:Ljava/util/Calendar;

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->t()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setMinDate(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->r:Ljava/util/Calendar;

    .line 22
    .line 23
    const/4 v1, 0x6

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eq v0, v1, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->u:Ljava/util/Calendar;

    .line 53
    .line 54
    iget-object p2, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->s:Ljava/util/Calendar;

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DatePickerZTE;->t()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setSelectorSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->j:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setSpinnersShown(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/DatePickerZTE;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 p1, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
