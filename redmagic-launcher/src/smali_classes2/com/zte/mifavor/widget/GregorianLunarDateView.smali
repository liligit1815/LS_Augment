.class public Lcom/zte/mifavor/widget/GregorianLunarDateView;
.super Landroid/widget/LinearLayout;
.source "GregorianLunarDateView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "WrongConstant"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/GregorianLunarDateView$d;,
        Lcom/zte/mifavor/widget/GregorianLunarDateView$c;
    }
.end annotation


# static fields
.field private static O:Z


# instance fields
.field private A:[Ljava/lang/String;

.field private B:Ljava/util/Calendar;

.field private C:Z

.field private D:Landroid/view/View;

.field private E:Z

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:Z

.field private N:Ljava/lang/String;

.field private final g:Landroid/widget/RelativeLayout;

.field private final h:Landroid/widget/LinearLayout;

.field private i:I

.field private j:I

.field private k:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private l:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private m:Lcom/zte/mifavor/widget/NumberPickerZTE;

.field private n:Landroid/widget/EditText;

.field private o:Landroid/widget/EditText;

.field private p:Landroid/widget/EditText;

.field private q:Lcom/zte/mifavor/widget/SwitchZTE;

.field private r:Landroid/view/View;

.field private s:Landroid/view/View;

.field private t:[Ljava/lang/String;

.field private u:[Ljava/lang/String;

.field private v:[Ljava/lang/String;

.field private w:[Ljava/lang/String;

.field private x:[Ljava/lang/String;

.field private y:[Ljava/lang/String;

.field private z:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p2, 0x76c

    .line 3
    iput p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    const/16 p2, 0x834

    .line 4
    iput p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    const/4 p2, 0x0

    .line 5
    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    .line 6
    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r:Landroid/view/View;

    .line 7
    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s:Landroid/view/View;

    const/4 p3, 0x1

    .line 8
    iput-boolean p3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E:Z

    const v1, 0x8ed3

    .line 10
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->F:I

    const/high16 v1, -0x76000000

    .line 11
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G:I

    const/high16 v1, 0x42000000    # 32.0f

    .line 12
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->H:I

    const v1, 0xffffff

    .line 13
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->I:I

    const/16 v1, 0x14

    .line 14
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->J:I

    const/16 v1, 0x10

    .line 15
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->K:I

    const/16 v1, 0xc

    .line 16
    iput v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->L:I

    .line 17
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->M:Z

    .line 18
    const-string v1, ""

    iput-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->N:Ljava/lang/String;

    .line 19
    sget v1, LR3/i;->v:I

    invoke-static {p1, v1, p0}, Landroid/widget/LinearLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D:Landroid/view/View;

    .line 20
    new-instance v1, Lcom/zte/mifavor/widget/GregorianLunarDateView$a;

    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView$a;-><init>(Lcom/zte/mifavor/widget/GregorianLunarDateView;)V

    .line 21
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    iput-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 23
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    invoke-virtual {v2, p3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iget-object v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    const/4 v5, 0x5

    .line 24
    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 25
    invoke-virtual {p0, v2, v3, v4, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r(IIILcom/zte/mifavor/widget/GregorianLunarDateView$d;)V

    .line 26
    new-instance p2, Landroid/content/res/Configuration;

    invoke-direct {p2}, Landroid/content/res/Configuration;-><init>()V

    .line 27
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "font_scale"

    iget p2, p2, Landroid/content/res/Configuration;->fontScale:F

    .line 29
    invoke-static {v2, v3, p2}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    .line 30
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D:Landroid/view/View;

    sget v2, LR3/g;->Y:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 31
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->J:I

    invoke-virtual {p2, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 32
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->K:I

    invoke-virtual {p2, v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 33
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    invoke-virtual {p2, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 34
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    sget v2, LR3/g;->R:I

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->n:Landroid/widget/EditText;

    .line 35
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D:Landroid/view/View;

    sget v3, LR3/g;->X:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 36
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->J:I

    invoke-virtual {p2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 37
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->K:I

    invoke-virtual {p2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 38
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    invoke-virtual {p2, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 39
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->o:Landroid/widget/EditText;

    .line 40
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D:Landroid/view/View;

    sget v3, LR3/g;->W:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/NumberPickerZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->J:I

    invoke-virtual {p2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setInputSize(I)V

    .line 42
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->K:I

    invoke-virtual {p2, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setSelectorSize(I)V

    .line 43
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    invoke-virtual {p2, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setOnValueChangedListener(Lcom/zte/mifavor/widget/NumberPickerZTE$j;)V

    .line 44
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p:Landroid/widget/EditText;

    .line 45
    sget p2, LR3/g;->Z:I

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->h:Landroid/widget/LinearLayout;

    .line 46
    invoke-direct {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->A()V

    .line 47
    sget p2, LR3/g;->s0:I

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/zte/mifavor/widget/SwitchZTE;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    .line 48
    sget p2, LR3/g;->F0:I

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r:Landroid/view/View;

    .line 49
    sget p2, LR3/g;->i:I

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s:Landroid/view/View;

    .line 50
    sget p2, LR3/g;->K:I

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/RelativeLayout;

    iput-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->g:Landroid/widget/RelativeLayout;

    .line 51
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "zh"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    new-instance p3, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;

    invoke-direct {p3, p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView$b;-><init>(Lcom/zte/mifavor/widget/GregorianLunarDateView;)V

    invoke-virtual {p2, p3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 53
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    invoke-virtual {p2, v0}, Landroid/widget/Switch;->setChecked(Z)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    .line 54
    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 55
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 56
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 57
    invoke-virtual {p0, p3}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setGregorian(Z)V

    .line 58
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, LR3/d;->i:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->F:I

    .line 59
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, LR3/d;->m:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G:I

    .line 60
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, LR3/d;->t:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->H:I

    .line 61
    iget p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->F:I

    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setColor(I)V

    return-void
.end method

.method private A()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

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
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->h:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 40
    .line 41
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

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
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->h:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 63
    .line 64
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->h:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 76
    .line 77
    invoke-direct {p0, v3, v1, v2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

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

.method private B(Lcom/zte/mifavor/widget/e;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setDisplayData(Z)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v(Lcom/zte/mifavor/widget/e;Z)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u(Lcom/zte/mifavor/widget/e;Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->t(Lcom/zte/mifavor/widget/e;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private C(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V
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

.method private E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p5, :cond_3

    .line 2
    .line 3
    array-length p0, p5

    .line 4
    if-eqz p0, :cond_2

    .line 5
    .line 6
    sub-int p0, p4, p3

    .line 7
    .line 8
    add-int/lit8 p0, p0, 0x1

    .line 9
    .line 10
    array-length v0, p5

    .line 11
    if-lt v0, p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMinValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getMaxValue()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr v1, v0

    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMinValue(I)V

    .line 25
    .line 26
    .line 27
    if-le p0, v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1, p5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p1, p4}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setMaxValue(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p5}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setDisplayedValues([Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p1, p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setValue(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 47
    .line 48
    const-string p1, "newDisplayedVales\'s length should not be less than newSpan."

    .line 49
    .line 50
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 55
    .line 56
    const-string p1, "newDisplayedVales\'s length should not be 0."

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 63
    .line 64
    const-string p1, "newDisplayedVales should not be null."

    .line 65
    .line 66
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method private F()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->n:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->n:Landroid/widget/EditText;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->o:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->o:Landroid/widget/EditText;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p:Landroid/widget/EditText;

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
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p:Landroid/widget/EditText;

    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

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

.method private I()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u:[Ljava/lang/String;

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

.method static bridge synthetic a(Lcom/zte/mifavor/widget/GregorianLunarDateView;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Ljava/util/Calendar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/GregorianLunarDateView;)Lcom/zte/mifavor/widget/NumberPickerZTE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/GregorianLunarDateView;Ljava/util/Calendar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/GregorianLunarDateView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(Lcom/zte/mifavor/widget/GregorianLunarDateView;IIIIZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x(IIIIZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic l(Lcom/zte/mifavor/widget/GregorianLunarDateView;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->y(IIZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m(Lcom/zte/mifavor/widget/GregorianLunarDateView;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n(Lcom/zte/mifavor/widget/GregorianLunarDateView;Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic o(Lcom/zte/mifavor/widget/GregorianLunarDateView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private p(Ljava/util/Calendar;IIZ)Ljava/util/Calendar;
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p1, p0}, Ljava/util/Calendar;->get(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    if-eqz p4, :cond_2

    .line 9
    .line 10
    const/4 p4, 0x5

    .line 11
    const/4 v2, 0x2

    .line 12
    if-ge v0, p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p0, p2}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v2, p0}, Ljava/util/Calendar;->set(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p4, p0}, Ljava/util/Calendar;->set(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    if-le v0, p3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1, p0, p3}, Ljava/util/Calendar;->set(II)V

    .line 26
    .line 27
    .line 28
    const/16 p0, 0xb

    .line 29
    .line 30
    invoke-virtual {p1, v2, p0}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    invoke-static {p3, v1}, Lcom/zte/mifavor/widget/s;->k(II)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, p4, p0}, Ljava/util/Calendar;->set(II)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-object p1

    .line 41
    :cond_2
    sub-int p1, v0, p2

    .line 42
    .line 43
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    sub-int/2addr v0, p3

    .line 48
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    if-ge p1, p4, :cond_3

    .line 53
    .line 54
    new-instance p1, Lcom/zte/mifavor/widget/e;

    .line 55
    .line 56
    invoke-direct {p1, p0, p2, p0, p0}, Lcom/zte/mifavor/widget/e;-><init>(ZIII)V

    .line 57
    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_3
    invoke-static {p3, v1}, Lcom/zte/mifavor/widget/s;->l(II)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    new-instance p2, Lcom/zte/mifavor/widget/e;

    .line 65
    .line 66
    invoke-direct {p2, p0, p3, v1, p1}, Lcom/zte/mifavor/widget/e;-><init>(ZIII)V

    .line 67
    .line 68
    .line 69
    return-object p2
.end method

.method private q(Ljava/util/Calendar;IIZ)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eqz p4, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1, p0}, Ljava/util/Calendar;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance p4, Lcom/zte/mifavor/widget/e;

    .line 10
    .line 11
    invoke-direct {p4, p1}, Lcom/zte/mifavor/widget/e;-><init>(Ljava/util/Calendar;)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0x321

    .line 15
    .line 16
    invoke-virtual {p4, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    :goto_0
    if-gt p2, p1, :cond_1

    .line 21
    .line 22
    if-gt p1, p3, :cond_1

    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private setDisplayData(Z)V
    .locals 5

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    iget p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 7
    .line 8
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 9
    .line 10
    sub-int/2addr p1, v2

    .line 11
    add-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    new-array p1, p1, [Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->t:[Ljava/lang/String;

    .line 16
    .line 17
    move p1, v1

    .line 18
    :goto_0
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 19
    .line 20
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 21
    .line 22
    sub-int/2addr v2, v3

    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    if-ge p1, v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->t:[Ljava/lang/String;

    .line 28
    .line 29
    add-int/2addr v3, p1

    .line 30
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    aput-object v3, v2, p1

    .line 35
    .line 36
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p1, Ljava/text/DateFormatSymbols;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/text/DateFormatSymbols;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u:[Ljava/lang/String;

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->I()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    new-array p1, v0, [Ljava/lang/String;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u:[Ljava/lang/String;

    .line 59
    .line 60
    move p1, v1

    .line 61
    :goto_1
    if-ge p1, v0, :cond_1

    .line 62
    .line 63
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u:[Ljava/lang/String;

    .line 64
    .line 65
    add-int/lit8 v3, p1, 0x1

    .line 66
    .line 67
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    aput-object v4, v2, p1

    .line 72
    .line 73
    move p1, v3

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const/16 p1, 0x1f

    .line 76
    .line 77
    new-array v0, p1, [Ljava/lang/String;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v:[Ljava/lang/String;

    .line 80
    .line 81
    :goto_2
    if-ge v1, p1, :cond_5

    .line 82
    .line 83
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v:[Ljava/lang/String;

    .line 84
    .line 85
    add-int/lit8 v2, v1, 0x1

    .line 86
    .line 87
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    aput-object v3, v0, v1

    .line 92
    .line 93
    move v1, v2

    .line 94
    goto :goto_2

    .line 95
    :cond_2
    iget p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 96
    .line 97
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 98
    .line 99
    sub-int/2addr p1, v2

    .line 100
    add-int/lit8 p1, p1, 0x1

    .line 101
    .line 102
    new-array p1, p1, [Ljava/lang/String;

    .line 103
    .line 104
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->w:[Ljava/lang/String;

    .line 105
    .line 106
    move p1, v1

    .line 107
    :goto_3
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 108
    .line 109
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 110
    .line 111
    sub-int/2addr v2, v3

    .line 112
    add-int/lit8 v2, v2, 0x1

    .line 113
    .line 114
    if-ge p1, v2, :cond_3

    .line 115
    .line 116
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->w:[Ljava/lang/String;

    .line 117
    .line 118
    add-int/2addr v3, p1

    .line 119
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    aput-object v3, v2, p1

    .line 124
    .line 125
    add-int/lit8 p1, p1, 0x1

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_3
    new-array p1, v0, [Ljava/lang/String;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 131
    .line 132
    move p1, v1

    .line 133
    :goto_4
    if-ge p1, v0, :cond_4

    .line 134
    .line 135
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 136
    .line 137
    add-int/lit8 v3, p1, 0x1

    .line 138
    .line 139
    invoke-static {v3}, Lcom/zte/mifavor/widget/s;->g(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    aput-object v4, v2, p1

    .line 144
    .line 145
    move p1, v3

    .line 146
    goto :goto_4

    .line 147
    :cond_4
    const/16 p1, 0x1e

    .line 148
    .line 149
    new-array v0, p1, [Ljava/lang/String;

    .line 150
    .line 151
    iput-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 152
    .line 153
    :goto_5
    if-ge v1, p1, :cond_5

    .line 154
    .line 155
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 156
    .line 157
    add-int/lit8 v2, v1, 0x1

    .line 158
    .line 159
    invoke-static {v2}, Lcom/zte/mifavor/widget/s;->f(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    aput-object v3, v0, v1

    .line 164
    .line 165
    move v1, v2

    .line 166
    goto :goto_5

    .line 167
    :cond_5
    return-void
.end method

.method public static setForce(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->O:Z

    .line 2
    .line 3
    return-void
.end method

.method private t(Lcom/zte/mifavor/widget/e;Z)V
    .locals 6

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-virtual {p1, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result v3

    .line 8
    const/4 v4, 0x2

    .line 9
    invoke-virtual {p1, v4}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    add-int/2addr v4, v2

    .line 14
    invoke-static {v3, v4}, Lcom/zte/mifavor/widget/s;->k(II)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const/4 v2, 0x5

    .line 19
    invoke-virtual {p1, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    .line 25
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v:[Ljava/lang/String;

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    move-object v0, p0

    .line 29
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/16 v2, 0x321

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/16 v3, 0x322

    .line 40
    .line 41
    invoke-virtual {p1, v3}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v2, v3}, Lcom/zte/mifavor/widget/s;->l(II)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/16 v2, 0x323

    .line 50
    .line 51
    invoke-virtual {p1, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 56
    .line 57
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 58
    .line 59
    const/4 v3, 0x1

    .line 60
    move-object v0, p0

    .line 61
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private u(Lcom/zte/mifavor/widget/e;Z)V
    .locals 7

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x2

    .line 6
    invoke-virtual {p1, p2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->u:[Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    move v3, p1

    .line 15
    move-object v6, p2

    .line 16
    move v5, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/16 p2, 0x321

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-static {p2}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const/16 v1, 0x322

    .line 29
    .line 30
    if-nez p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p1, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-static {p1, p2}, Lcom/zte/mifavor/widget/s;->a(II)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-static {p2}, Lcom/zte/mifavor/widget/s;->e(I)[Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const/16 v0, 0xd

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :goto_1
    const/4 v4, 0x1

    .line 55
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    invoke-direct/range {v1 .. v6}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private v(Lcom/zte/mifavor/widget/e;Z)V
    .locals 12

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-virtual {p1, p2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    iget v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 11
    .line 12
    iget v4, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 13
    .line 14
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->t:[Ljava/lang/String;

    .line 15
    .line 16
    move-object v0, p0

    .line 17
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v0, p0

    .line 22
    const/16 p0, 0x321

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result v8

    .line 28
    iget-object v7, v0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 29
    .line 30
    iget v9, v0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 31
    .line 32
    iget v10, v0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 33
    .line 34
    iget-object v11, v0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->w:[Ljava/lang/String;

    .line 35
    .line 36
    move-object v6, v0

    .line 37
    invoke-direct/range {v6 .. v11}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :goto_0
    iget-object p0, v0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->setWrapSelectorWheel(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private w()V
    .locals 0

    .line 1
    return-void
.end method

.method private x(IIIIZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1, p3, p5}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p2, p4, p5}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    if-ne p1, v5, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-gt v0, v5, :cond_1

    .line 19
    .line 20
    move v3, v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v3, v5

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 24
    .line 25
    if-eqz p5, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v:[Ljava/lang/String;

    .line 28
    .line 29
    :goto_1
    move-object v6, p1

    .line 30
    goto :goto_2

    .line 31
    :cond_2
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :goto_2
    const/4 v4, 0x1

    .line 35
    move-object v1, p0

    .line 36
    invoke-direct/range {v1 .. v6}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private y(IIZ)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    if-eqz p3, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {p1, v6, v1}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {p2, v6, v1}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-ne v2, v4, :cond_0

    .line 25
    .line 26
    goto/16 :goto_4

    .line 27
    .line 28
    :cond_0
    if-gt v7, v4, :cond_1

    .line 29
    .line 30
    move v2, v7

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move v2, v4

    .line 33
    :goto_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->v:[Ljava/lang/String;

    .line 37
    .line 38
    move-object v0, p0

    .line 39
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-static {p2}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ne v1, v2, :cond_5

    .line 52
    .line 53
    invoke-static {v6, v2}, Lcom/zte/mifavor/widget/s;->b(II)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-static {v6, v1}, Lcom/zte/mifavor/widget/s;->b(II)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {p1, v2}, Lcom/zte/mifavor/widget/s;->l(II)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {p2, v1}, Lcom/zte/mifavor/widget/s;->l(II)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-ne v2, v4, :cond_3

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_3
    if-gt v7, v4, :cond_4

    .line 73
    .line 74
    move v2, v7

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move v2, v4

    .line 77
    :goto_1
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 78
    .line 79
    const/4 v3, 0x1

    .line 80
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 81
    .line 82
    move-object v0, p0

    .line 83
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_5
    invoke-static {v1}, Lcom/zte/mifavor/widget/s;->e(I)[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iput-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->A:[Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v6, v2}, Lcom/zte/mifavor/widget/s;->b(II)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-static {v2, v1}, Lcom/zte/mifavor/widget/s;->a(II)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    move v3, v1

    .line 106
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 107
    .line 108
    if-nez v3, :cond_6

    .line 109
    .line 110
    const/16 v3, 0xc

    .line 111
    .line 112
    :goto_2
    move v4, v3

    .line 113
    goto :goto_3

    .line 114
    :cond_6
    const/16 v3, 0xd

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :goto_3
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->A:[Ljava/lang/String;

    .line 118
    .line 119
    const/4 v3, 0x1

    .line 120
    move-object v0, p0

    .line 121
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const/4 v1, 0x0

    .line 125
    invoke-static {p1, v6, v1}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-static {p2, v2, v1}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-ne v3, v4, :cond_7

    .line 134
    .line 135
    :goto_4
    return-void

    .line 136
    :cond_7
    if-gt v7, v4, :cond_8

    .line 137
    .line 138
    move v2, v7

    .line 139
    goto :goto_5

    .line 140
    :cond_8
    move v2, v4

    .line 141
    :goto_5
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 142
    .line 143
    const/4 v3, 0x1

    .line 144
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 145
    .line 146
    move-object v0, p0

    .line 147
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method private z(II)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 14
    .line 15
    invoke-virtual {v1, p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->W(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    :goto_0
    mul-int/lit8 v1, v6, 0x2

    .line 28
    .line 29
    add-int/lit8 v1, v1, -0x1

    .line 30
    .line 31
    :goto_1
    move v2, v1

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-gt v6, v2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    if-ne v1, v6, :cond_2

    .line 47
    .line 48
    mul-int/lit8 v1, v6, 0x2

    .line 49
    .line 50
    add-int/lit8 v1, v1, -0x2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    mul-int/lit8 v1, v6, 0x2

    .line 54
    .line 55
    add-int/lit8 v1, v1, -0x3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :goto_2
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 59
    .line 60
    const/16 v4, 0x18

    .line 61
    .line 62
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->y:[Ljava/lang/String;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    move-object v0, p0

    .line 66
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 70
    .line 71
    const/16 v4, 0x1e

    .line 72
    .line 73
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 74
    .line 75
    move v2, v7

    .line 76
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget v1, LR3/g;->G0:I

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Landroid/widget/TextView;

    .line 86
    .line 87
    const/4 v2, 0x4

    .line 88
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 92
    .line 93
    invoke-virtual {v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->W(I)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_b

    .line 98
    .line 99
    invoke-static {p2}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    rem-int/lit8 v1, v6, 0x2

    .line 106
    .line 107
    if-nez v1, :cond_4

    .line 108
    .line 109
    div-int/lit8 v6, v6, 0x2

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    div-int/lit8 v6, v6, 0x2

    .line 113
    .line 114
    add-int/lit8 v6, v6, 0x1

    .line 115
    .line 116
    :goto_3
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 117
    .line 118
    const/16 v2, 0xc

    .line 119
    .line 120
    :goto_4
    move-object v5, v1

    .line 121
    move v4, v2

    .line 122
    move v2, v6

    .line 123
    goto :goto_7

    .line 124
    :cond_5
    rem-int/lit8 v2, v6, 0x2

    .line 125
    .line 126
    if-nez v2, :cond_7

    .line 127
    .line 128
    div-int/lit8 v6, v6, 0x2

    .line 129
    .line 130
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-ge v6, v2, :cond_6

    .line 135
    .line 136
    goto :goto_6

    .line 137
    :cond_6
    :goto_5
    add-int/lit8 v6, v6, 0x1

    .line 138
    .line 139
    goto :goto_6

    .line 140
    :cond_7
    div-int/lit8 v6, v6, 0x2

    .line 141
    .line 142
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-ge v6, v2, :cond_8

    .line 147
    .line 148
    goto :goto_5

    .line 149
    :cond_8
    add-int/lit8 v6, v6, 0x2

    .line 150
    .line 151
    :goto_6
    invoke-static {v1}, Lcom/zte/mifavor/widget/s;->e(I)[Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    const/16 v2, 0xd

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :goto_7
    const/4 v3, 0x1

    .line 159
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 160
    .line 161
    move-object v0, p0

    .line 162
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    const/4 v6, 0x0

    .line 166
    invoke-static {p2, v2, v6}, Lcom/zte/mifavor/widget/s;->j(IIZ)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    const/16 v1, 0x1e

    .line 171
    .line 172
    if-eq v1, v4, :cond_a

    .line 173
    .line 174
    if-gt v7, v4, :cond_9

    .line 175
    .line 176
    move v2, v7

    .line 177
    goto :goto_8

    .line 178
    :cond_9
    move v2, v4

    .line 179
    :goto_8
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 180
    .line 181
    const/4 v3, 0x1

    .line 182
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 183
    .line 184
    move-object v0, p0

    .line 185
    invoke-direct/range {v0 .. v5}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_a
    sget v1, LR3/g;->G0:I

    .line 189
    .line 190
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Landroid/widget/TextView;

    .line 195
    .line 196
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 197
    .line 198
    .line 199
    :cond_b
    return-void
.end method


# virtual methods
.method public D(Lcom/zte/mifavor/widget/NumberPickerZTE;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ne p0, p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 p0, 0x8

    .line 9
    .line 10
    if-eq p2, p0, :cond_2

    .line 11
    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x4

    .line 15
    if-ne p2, p0, :cond_1

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    return-void

    .line 19
    :cond_2
    :goto_1
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public G(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->getCalendarData()Lcom/zte/mifavor/widget/GregorianLunarDateView$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;->a()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/zte/mifavor/widget/e;

    .line 10
    .line 11
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 12
    .line 13
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q(Ljava/util/Calendar;IIZ)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 22
    .line 23
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 24
    .line 25
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p(Ljava/util/Calendar;IIZ)Ljava/util/Calendar;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/zte/mifavor/widget/e;

    .line 30
    .line 31
    :cond_0
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E:Z

    .line 35
    .line 36
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    .line 37
    .line 38
    xor-int/lit8 v2, p1, 0x1

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E:Z

    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s(Ljava/util/Calendar;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->H(Ljava/util/Calendar;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public H(Ljava/util/Calendar;)V
    .locals 7

    .line 1
    sget v0, LR3/g;->G0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    const/4 v4, 0x2

    .line 24
    invoke-static {v1, v2, v3, v4}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x5

    .line 38
    invoke-virtual {p1, v5}, Ljava/util/Calendar;->get(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-boolean v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->M:Z

    .line 43
    .line 44
    if-nez v5, :cond_1

    .line 45
    .line 46
    iget-object v5, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q:Lcom/zte/mifavor/widget/SwitchZTE;

    .line 47
    .line 48
    if-eqz v5, :cond_0

    .line 49
    .line 50
    invoke-virtual {v5}, Landroid/widget/Switch;->isChecked()Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_0

    .line 55
    .line 56
    new-instance v1, Lcom/zte/mifavor/widget/e;

    .line 57
    .line 58
    invoke-direct {v1, v3, v4, p1}, Lcom/zte/mifavor/widget/e;-><init>(III)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->N:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/e;->p()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    goto :goto_0

    .line 83
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    iget-object v6, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->N:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    sget v6, LR3/b;->c:I

    .line 105
    .line 106
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    const/4 v6, 0x0

    .line 111
    aget-object v3, v3, v6

    .line 112
    .line 113
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    add-int/2addr v4, v2

    .line 117
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    sget v3, LR3/b;->b:I

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    aget-object v2, v2, v6

    .line 135
    .line 136
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    sget p1, LR3/b;->a:I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    aget-object p0, p0, v6

    .line 157
    .line 158
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p0, " "

    .line 162
    .line 163
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    :cond_1
    return-void
.end method

.method public getCalendarData()Lcom/zte/mifavor/widget/GregorianLunarDateView$c;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    new-instance v3, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 22
    .line 23
    invoke-direct {v3, v0, v1, v2, p0}, Lcom/zte/mifavor/widget/GregorianLunarDateView$c;-><init>(IIIZ)V

    .line 24
    .line 25
    .line 26
    return-object v3
.end method

.method public getDayOfMonth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

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

.method public getIsGregorian()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMonth()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

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

.method public getNumberPickerDay()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumberPickerMonth()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumberPickerYear()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPickerDayOfMonth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

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

.method public getPickerMonth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

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

.method public getPickerYear()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

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

.method public getYear()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

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

.method public r(IIILcom/zte/mifavor/widget/GregorianLunarDateView$d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public s(Ljava/util/Calendar;Z)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 4
    .line 5
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q(Ljava/util/Calendar;IIZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 12
    .line 13
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 14
    .line 15
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p(Ljava/util/Calendar;IIZ)Ljava/util/Calendar;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 20
    .line 21
    instance-of p2, p1, Lcom/zte/mifavor/widget/e;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    check-cast p1, Lcom/zte/mifavor/widget/e;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance p2, Lcom/zte/mifavor/widget/e;

    .line 29
    .line 30
    invoke-direct {p2, p1}, Lcom/zte/mifavor/widget/e;-><init>(Ljava/util/Calendar;)V

    .line 31
    .line 32
    .line 33
    move-object p1, p2

    .line 34
    :goto_0
    iget-boolean p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 35
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B(Lcom/zte/mifavor/widget/e;Z)V

    .line 37
    .line 38
    .line 39
    iget-boolean p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 40
    .line 41
    if-nez p2, :cond_2

    .line 42
    .line 43
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/s;->c(II)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, v0, p2, v1}, Lcom/zte/mifavor/widget/e;->c(III)Ljava/util/Calendar;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    const/4 v0, 0x1

    .line 87
    invoke-virtual {p1, v0, p2}, Ljava/util/Calendar;->set(II)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 91
    .line 92
    iget-object p2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 93
    .line 94
    invoke-virtual {p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    sub-int/2addr p2, v0

    .line 99
    const/4 v0, 0x2

    .line 100
    invoke-virtual {p1, v0, p2}, Ljava/util/Calendar;->set(II)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->getValue()I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    const/4 p2, 0x5

    .line 112
    invoke-virtual {p1, p2, p0}, Ljava/util/Calendar;->set(II)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public setColor(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G:I

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    iget v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 16
    .line 17
    iget p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G:I

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j0(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setDisplayDayLunar(I)V
    .locals 4

    .line 1
    new-array v0, p1, [Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-ge v0, p1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 9
    .line 10
    add-int/lit8 v2, v0, 0x1

    .line 11
    .line 12
    invoke-static {v2}, Lcom/zte/mifavor/widget/s;->f(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    aput-object v3, v1, v0

    .line 17
    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public setDisplayMonthsAndDaysLunarNoYear(Ljava/util/Calendar;)V
    .locals 13

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    new-array v1, v0, [Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->y:[Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_0

    .line 10
    .line 11
    iget-object v3, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->y:[Ljava/lang/String;

    .line 12
    .line 13
    add-int/lit8 v4, v2, 0x1

    .line 14
    .line 15
    invoke-static {v4}, Lcom/zte/mifavor/widget/s;->h(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    aput-object v5, v3, v2

    .line 20
    .line 21
    move v2, v4

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 24
    .line 25
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 26
    .line 27
    invoke-direct {p0, p1, v0, v2, v1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->q(Ljava/util/Calendar;IIZ)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 34
    .line 35
    iget v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 36
    .line 37
    invoke-direct {p0, p1, v0, v2, v1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->p(Ljava/util/Calendar;IIZ)Ljava/util/Calendar;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :cond_1
    new-instance v0, Lcom/zte/mifavor/widget/e;

    .line 42
    .line 43
    invoke-direct {v0, p1}, Lcom/zte/mifavor/widget/e;-><init>(Ljava/util/Calendar;)V

    .line 44
    .line 45
    .line 46
    const/16 p1, 0x321

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-static {p1}, Lcom/zte/mifavor/widget/s;->i(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/16 v1, 0x322

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    mul-int/lit8 p1, p1, 0x2

    .line 65
    .line 66
    add-int/lit8 p1, p1, -0x1

    .line 67
    .line 68
    :goto_1
    move v3, p1

    .line 69
    goto :goto_2

    .line 70
    :cond_2
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-static {v1, p1}, Lcom/zte/mifavor/widget/s;->a(II)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-gt v1, v2, :cond_3

    .line 83
    .line 84
    mul-int/lit8 v1, v1, 0x2

    .line 85
    .line 86
    add-int/lit8 p1, v1, -0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    add-int/lit8 p1, p1, 0x1

    .line 94
    .line 95
    if-ne v1, p1, :cond_4

    .line 96
    .line 97
    mul-int/lit8 v1, v1, 0x2

    .line 98
    .line 99
    add-int/lit8 p1, v1, -0x2

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    mul-int/lit8 v1, v1, 0x2

    .line 103
    .line 104
    add-int/lit8 p1, v1, -0x3

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :goto_2
    iget-object v2, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 108
    .line 109
    const/16 v5, 0x18

    .line 110
    .line 111
    iget-object v6, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->y:[Ljava/lang/String;

    .line 112
    .line 113
    const/4 v4, 0x1

    .line 114
    move-object v1, p0

    .line 115
    invoke-direct/range {v1 .. v6}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const/16 p0, 0x323

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 121
    .line 122
    .line 123
    move-result v9

    .line 124
    iget-object v8, v1, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 125
    .line 126
    const/16 v11, 0x1e

    .line 127
    .line 128
    iget-object v12, v1, Lcom/zte/mifavor/widget/GregorianLunarDateView;->z:[Ljava/lang/String;

    .line 129
    .line 130
    const/4 v10, 0x1

    .line 131
    move-object v7, v1

    .line 132
    invoke-direct/range {v7 .. v12}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->E(Lcom/zte/mifavor/widget/NumberPickerZTE;III[Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    sget p0, LR3/g;->G0:I

    .line 136
    .line 137
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Landroid/widget/TextView;

    .line 142
    .line 143
    const/4 p1, 0x4

    .line 144
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public setDisplayMonthsLunar(I)V
    .locals 4

    .line 1
    new-array v0, p1, [Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-ge v0, p1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->x:[Ljava/lang/String;

    .line 9
    .line 10
    add-int/lit8 v2, v0, 0x1

    .line 11
    .line 12
    invoke-static {v2}, Lcom/zte/mifavor/widget/s;->g(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    aput-object v3, v1, v0

    .line 17
    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public setForceUpdate(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setForce(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setGregorian(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->C:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "zh"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->G(Z)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public setMaxYear(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setMinYear(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setNeedCustomSubTitle(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->M:Z

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "set Need Custom SubTitle custom"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "GregorianLunarDateView"

    .line 21
    .line 22
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setNumberPickerDayVisibility(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->m:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D(Lcom/zte/mifavor/widget/NumberPickerZTE;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setNumberPickerMonthVisibility(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->l:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D(Lcom/zte/mifavor/widget/NumberPickerZTE;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setNumberPickerYearVisibility(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->k:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->D(Lcom/zte/mifavor/widget/NumberPickerZTE;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPrefixSubtitle(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, " "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->N:Ljava/lang/String;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->setWeekVisibility(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setSubTitle(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, LR3/g;->G0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getVisibility()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setSwitchShown(Z)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "zh"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->g:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    move v3, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v3, v1

    .line 27
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r:Landroid/view/View;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    move v3, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v3, v1

    .line 37
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s:Landroid/view/View;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    move v1, v2

    .line 45
    :cond_2
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->g:Landroid/widget/RelativeLayout;

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->r:Landroid/view/View;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->s:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public setWeekVisibility(Z)V
    .locals 1

    .line 1
    sget v0, LR3/g;->G0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 p1, 0x8

    .line 14
    .line 15
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/zte/mifavor/widget/GregorianLunarDateView;->B:Ljava/util/Calendar;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/GregorianLunarDateView;->H(Ljava/util/Calendar;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
