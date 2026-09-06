.class Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;
.super Ljava/lang/Object;
.source "GroupWidgetContainer.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetContainer;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->l(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v0, " onLongClick "

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "GroupWidgetContainer"

    .line 25
    .line 26
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$a;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 30
    .line 31
    invoke-static {p0, p0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->c(Landroid/view/View;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method
