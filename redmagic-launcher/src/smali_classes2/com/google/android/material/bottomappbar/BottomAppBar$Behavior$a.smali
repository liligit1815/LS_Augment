.class Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;
.super Ljava/lang/Object;
.source "BottomAppBar.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;


# direct methods
.method constructor <init>(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;->S(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/google/android/material/bottomappbar/BottomAppBar;

    .line 12
    .line 13
    if-eqz p2, :cond_5

    .line 14
    .line 15
    instance-of p3, p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 16
    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    instance-of p3, p1, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    .line 20
    .line 21
    if-nez p3, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    instance-of p4, p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 30
    .line 31
    if-eqz p4, :cond_1

    .line 32
    .line 33
    move-object p3, p1

    .line 34
    check-cast p3, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 35
    .line 36
    iget-object p4, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 37
    .line 38
    invoke-static {p4}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;->T(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-virtual {p3, p4}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->j(Landroid/graphics/Rect;)V

    .line 43
    .line 44
    .line 45
    iget-object p4, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 46
    .line 47
    invoke-static {p4}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;->T(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)Landroid/graphics/Rect;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 52
    .line 53
    .line 54
    move-result p4

    .line 55
    invoke-virtual {p2, p4}, Lcom/google/android/material/bottomappbar/BottomAppBar;->G0(I)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p3}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getShapeAppearanceModel()Lq3/k;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3}, Lq3/k;->r()Lq3/c;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    new-instance p5, Landroid/graphics/RectF;

    .line 67
    .line 68
    iget-object p6, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 69
    .line 70
    invoke-static {p6}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;->T(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)Landroid/graphics/Rect;

    .line 71
    .line 72
    .line 73
    move-result-object p6

    .line 74
    invoke-direct {p5, p6}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p3, p5}, Lq3/c;->a(Landroid/graphics/RectF;)F

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    invoke-virtual {p2, p3}, Lcom/google/android/material/bottomappbar/BottomAppBar;->setFabCornerSize(F)V

    .line 82
    .line 83
    .line 84
    move p3, p4

    .line 85
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    check-cast p4, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior$a;->g:Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;

    .line 92
    .line 93
    invoke-static {p0}, Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;->U(Lcom/google/android/material/bottomappbar/BottomAppBar$Behavior;)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_4

    .line 98
    .line 99
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->m0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    const/4 p5, 0x1

    .line 104
    if-ne p0, p5, :cond_2

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    sub-int/2addr p0, p3

    .line 111
    div-int/lit8 p0, p0, 0x2

    .line 112
    .line 113
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    sget p5, LX2/d;->U:I

    .line 118
    .line 119
    invoke-virtual {p3, p5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    sub-int/2addr p3, p0

    .line 124
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->e0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    add-int/2addr p0, p3

    .line 129
    iput p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 130
    .line 131
    :cond_2
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->f0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    iput p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 136
    .line 137
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->g0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    iput p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 142
    .line 143
    invoke-static {p1}, Lcom/google/android/material/internal/s;->h(Landroid/view/View;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_3

    .line 148
    .line 149
    iget p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 150
    .line 151
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->h0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    add-int/2addr p0, p1

    .line 156
    iput p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_3
    iget p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 160
    .line 161
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->h0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    add-int/2addr p0, p1

    .line 166
    iput p0, p4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 167
    .line 168
    :cond_4
    :goto_0
    invoke-static {p2}, Lcom/google/android/material/bottomappbar/BottomAppBar;->U(Lcom/google/android/material/bottomappbar/BottomAppBar;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_5
    :goto_1
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method
