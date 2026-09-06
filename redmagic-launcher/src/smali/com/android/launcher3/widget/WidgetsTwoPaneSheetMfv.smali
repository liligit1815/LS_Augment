.class public Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;
.super Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;
.source "WidgetsTwoPaneSheetMfv.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private X0:Lcom/android/launcher3/ExtendedEditText;

.field private Y0:Landroid/view/ViewGroup;

.field private Z0:Landroid/widget/Toast;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic C2(Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->D2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private D2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->I0:Landroid/view/View;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    instance-of v1, v0, Lcom/android/launcher3/menu/MenuContainer;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/menu/MenuContainer;

    .line 27
    .line 28
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 41
    .line 42
    .line 43
    const/high16 v1, 0x3f800000    # 1.0f

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method

.method private E2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 8
    .line 9
    check-cast v1, Lcom/android/launcher3/v;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 20
    .line 21
    check-cast v1, Lcom/android/launcher3/v;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 28
    .line 29
    int-to-float v1, v1

    .line 30
    const v2, 0x3f63d70a    # 0.89f

    .line 31
    .line 32
    .line 33
    mul-float/2addr v1, v2

    .line 34
    float-to-int v1, v1

    .line 35
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v1, -0x1

    .line 39
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 40
    .line 41
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 42
    .line 43
    check-cast v1, Lcom/android/launcher3/v;

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    const/high16 v2, 0x3e800000    # 0.25f

    .line 53
    .line 54
    mul-float/2addr v1, v2

    .line 55
    float-to-int v1, v1

    .line 56
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 59
    .line 60
    check-cast v1, Lcom/android/launcher3/v;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 67
    .line 68
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 69
    .line 70
    sub-int/2addr v1, v2

    .line 71
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 83
    .line 84
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method


# virtual methods
.method protected S1()V
    .locals 4

    .line 1
    const v0, 0x7f0b03e2

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->f(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->S1()V

    .line 25
    .line 26
    .line 27
    const v0, 0x7f0b06a3

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/launcher3/ExtendedEditText;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->X0:Lcom/android/launcher3/ExtendedEditText;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->X0:Lcom/android/launcher3/ExtendedEditText;

    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const v3, 0x7f0811e6

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/N5;->S(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->X0:Lcom/android/launcher3/ExtendedEditText;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    const v0, 0x7f0b0249

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/view/ViewGroup;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Y0:Landroid/view/ViewGroup;

    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 77
    .line 78
    const v1, 0x7f0b00e2

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/TextView;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->W0:Landroid/widget/TextView;

    .line 88
    .line 89
    return-void
.end method

.method protected U1(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getRecyclerView()Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->getScrollbar()Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    const/4 v4, 0x0

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getThumbOffsetY()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    return v3

    .line 28
    :cond_0
    return v4

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, -0x1

    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_3

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    return v4

    .line 54
    :cond_3
    :goto_0
    return v3

    .line 55
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 60
    .line 61
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_7

    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 76
    .line 77
    invoke-virtual {p0, v3}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_5

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_5
    return v4

    .line 85
    :cond_6
    :goto_1
    return v3

    .line 86
    :cond_7
    return v4
.end method

.method protected X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->E()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->a:I

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    if-ne p1, v1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Y0:Landroid/view/ViewGroup;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move v0, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->x0:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Y0:Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public Y(ZJ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 7
    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->d0()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->D2()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-wide/16 p2, 0x64

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object p2, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance p2, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv$a;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv$a;-><init>(Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method protected d0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->d0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast p0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Z0:Landroid/widget/Toast;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/Toast;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const v0, 0x7f1400fa

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Lcom/android/launcher3/N5;->h0(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Z0:Landroid/widget/Toast;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->E2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->U1(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->D0:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->c()V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->Z(Landroid/view/MotionEvent;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 46
    .line 47
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->Z(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateFull()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const-wide/16 v2, 0x104

    .line 40
    .line 41
    invoke-virtual {p0, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const-wide/16 v2, 0xc8

    .line 52
    .line 53
    invoke-virtual {p0, v1, v2, v3}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->Y(ZJ)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return v1
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f080858

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/views/f;->g0(Landroid/graphics/drawable/Drawable;Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;->E2()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/ExtendedEditText;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/ExtendedEditText;->j()V

    .line 10
    .line 11
    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    cmpl-float p1, p1, p2

    .line 20
    .line 21
    if-ltz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 24
    .line 25
    .line 26
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 27
    .line 28
    sub-float p1, p2, p1

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p2, p1}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    invoke-virtual {p0, p2, v0, v1}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object p2, Lcom/android/launcher3/anim/L;->g:Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 10
    .line 11
    check-cast v0, Lcom/android/launcher3/v;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 33
    .line 34
    check-cast v0, Lcom/android/launcher3/v;

    .line 35
    .line 36
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    :goto_0
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iput-boolean v1, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 47
    .line 48
    const-wide/16 v2, 0xfa

    .line 49
    .line 50
    invoke-virtual {p0, v2, v3}, Lcom/android/launcher3/widget/o;->w0(J)V

    .line 51
    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 54
    .line 55
    :cond_1
    return p1

    .line 56
    :cond_2
    return v1
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/widget/o;->H:I

    .line 4
    .line 5
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 12
    .line 13
    const v0, 0x7f0b0362

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
