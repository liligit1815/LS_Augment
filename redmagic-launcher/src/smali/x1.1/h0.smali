.class public Lx1/h0;
.super Ljava/lang/Object;
.source "WidgetRepeatDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lx1/h0$a;
    }
.end annotation


# static fields
.field private static b:Lx1/h0;


# instance fields
.field private a:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lx1/h0;Lx1/h0$a;Lcom/android/launcher3/C2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lx1/h0;->h(Lx1/h0$a;Lcom/android/launcher3/C2;Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lx1/h0$a;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Lx1/h0$a;->a()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic c(Lx1/h0;Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lx1/h0;->i(Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lx1/h0$a;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Lx1/h0$a;->b()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static g()Lx1/h0;
    .locals 2

    .line 1
    const-class v0, Lx1/h0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lx1/h0;->b:Lx1/h0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lx1/h0;

    .line 9
    .line 10
    invoke-direct {v1}, Lx1/h0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lx1/h0;->b:Lx1/h0;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lx1/h0;->b:Lx1/h0;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method

.method private synthetic h(Lx1/h0$a;Lcom/android/launcher3/C2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lx1/h0$a;->onDismiss()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Lx1/h0;->e()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    invoke-interface {p2, p0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p2}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method private synthetic i(Lcom/zte/mifavor/widget/CheckBoxZTE;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    xor-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    const-string p2, "com.zte.mifavor.launcher.action.ADD_WIDGET"

    .line 14
    .line 15
    invoke-static {p0, p2, p1}, Lx1/O;->F4(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public f(Lcom/android/launcher3/C2;Lx1/h0$a;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_0

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_1
    new-instance v0, Lx1/e;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    const v4, 0x7f0e00c3

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v4, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const v2, 0x7f140480

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lx1/e;->n(I)Lx1/e;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Lx1/d0;

    .line 54
    .line 55
    invoke-direct {v2, p2}, Lx1/d0;-><init>(Lx1/h0$a;)V

    .line 56
    .line 57
    .line 58
    const v3, 0x7f1400f7

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v3, v2}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Lx1/e0;

    .line 66
    .line 67
    invoke-direct {v2, p2}, Lx1/e0;-><init>(Lx1/h0$a;)V

    .line 68
    .line 69
    .line 70
    const v3, 0x7f1400f9

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v3, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lx1/e;->a()Landroid/app/Dialog;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 82
    .line 83
    new-instance v2, Lx1/f0;

    .line 84
    .line 85
    invoke-direct {v2, p0, p2, p1}, Lx1/f0;-><init>(Lx1/h0;Lx1/h0$a;Lcom/android/launcher3/C2;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 89
    .line 90
    .line 91
    const p2, 0x7f0b0211

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    check-cast p2, Lcom/zte/mifavor/widget/CheckBoxZTE;

    .line 99
    .line 100
    new-instance v0, Lx1/g0;

    .line 101
    .line 102
    invoke-direct {v0, p0, p2}, Lx1/g0;-><init>(Lx1/h0;Lcom/zte/mifavor/widget/CheckBoxZTE;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    if-eqz p2, :cond_2

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p2, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Lcom/android/launcher3/u4;->c(Landroid/content/DialogInterface;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    iget-object p1, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lx1/h0;->a:Landroid/app/Dialog;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    if-eqz p0, :cond_3

    .line 135
    .line 136
    const/high16 p1, -0x80000000

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V

    .line 139
    .line 140
    .line 141
    :cond_3
    :goto_0
    return-void
.end method
