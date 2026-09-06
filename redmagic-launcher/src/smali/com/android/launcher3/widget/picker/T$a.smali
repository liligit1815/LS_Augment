.class Lcom/android/launcher3/widget/picker/T$a;
.super Ljava/lang/Object;
.source "WidgetsListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/picker/T;->Z(Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/picker/T;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/T$a;->g:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/picker/T$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T$a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/T$a;->g:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/T;->t(Lcom/android/launcher3/widget/picker/T;)Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/MoreWidgetsHeader;->g()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T$a;->g:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/T;->v(Lcom/android/launcher3/widget/picker/T;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T$a;->g:Lcom/android/launcher3/widget/picker/T;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/T;->u(Lcom/android/launcher3/widget/picker/T;)Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/T$a;->g:Lcom/android/launcher3/widget/picker/T;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/T;->u(Lcom/android/launcher3/widget/picker/T;)Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Lcom/android/launcher3/widget/picker/S;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/S;-><init>(Lcom/android/launcher3/widget/picker/T$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
