.class Lcom/android/launcher3/cloudfolder/CloudPagerHelper$a;
.super Ljava/lang/Object;
.source "CloudPagerHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/cloudfolder/CloudPagerHelper;->nextPage(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/cloudfolder/CloudPagerHelper;


# direct methods
.method constructor <init>(Lcom/android/launcher3/cloudfolder/CloudPagerHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/CloudPagerHelper$a;->g:Lcom/android/launcher3/cloudfolder/CloudPagerHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/CloudPagerHelper$a;->g:Lcom/android/launcher3/cloudfolder/CloudPagerHelper;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/cloudfolder/CloudPagerHelper;->a(Lcom/android/launcher3/cloudfolder/CloudPagerHelper;)Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const v0, 0x7f140338

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
