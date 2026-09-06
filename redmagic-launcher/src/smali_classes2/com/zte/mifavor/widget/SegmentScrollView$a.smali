.class Lcom/zte/mifavor/widget/SegmentScrollView$a;
.super Ljava/lang/Object;
.source "SegmentScrollView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/SegmentScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/SegmentScrollView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/SegmentScrollView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->a(Lcom/zte/mifavor/widget/SegmentScrollView;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "onGlobalLayout in. "

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 17
    .line 18
    sget v1, LR3/g;->l0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/zte/mifavor/widget/SegmentSelector;

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/SegmentScrollView;->f(Lcom/zte/mifavor/widget/SegmentScrollView;Lcom/zte/mifavor/widget/SegmentSelector;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 30
    .line 31
    sget v1, LR3/g;->k0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/widget/ImageView;

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/SegmentScrollView;->g(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/widget/ImageView;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 43
    .line 44
    sget v1, LR3/g;->n0:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/widget/ImageView;

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/SegmentScrollView;->h(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/widget/ImageView;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->c(Lcom/zte/mifavor/widget/SegmentScrollView;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v1, LR3/f;->H:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget v1, LR3/f;->G:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->d(Lcom/zte/mifavor/widget/SegmentScrollView;)Lcom/zte/mifavor/widget/SegmentSelector;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->d(Lcom/zte/mifavor/widget/SegmentScrollView;)Lcom/zte/mifavor/widget/SegmentSelector;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 109
    .line 110
    invoke-static {v1}, Lcom/zte/mifavor/widget/SegmentScrollView;->c(Lcom/zte/mifavor/widget/SegmentScrollView;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/SegmentSelector;->setNightStyle(Z)V

    .line 115
    .line 116
    .line 117
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 118
    .line 119
    new-instance v1, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;-><init>(Lcom/zte/mifavor/widget/SegmentScrollView$a;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 134
    .line 135
    .line 136
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 137
    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 141
    .line 142
    invoke-static {p0}, Lcom/zte/mifavor/widget/SegmentScrollView;->a(Lcom/zte/mifavor/widget/SegmentScrollView;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    const-string v0, "onGlobalLayout out. "

    .line 147
    .line 148
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    :cond_4
    return-void
.end method
