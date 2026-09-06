.class Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;
.super Ljava/lang/Object;
.source "WidgetsTwoPaneSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->A2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->b(Landroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic b(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->k2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Landroid/view/MenuItem;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/PopupMenu;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->n2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x800005

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, p1, v2}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const v1, 0x7f140487

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;->g:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 39
    .line 40
    iget-boolean v1, v1, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;->a:Z

    .line 41
    .line 42
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/android/launcher3/widget/picker/n0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/n0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method
