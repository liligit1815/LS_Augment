.class Lcom/android/launcher3/FoldHelpTipAty$a;
.super Ljava/lang/Object;
.source "FoldHelpTipAty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/FoldHelpTipAty;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Landroid/content/Context;

.field final synthetic i:Lcom/android/launcher3/FoldHelpTipAty;


# direct methods
.method constructor <init>(Lcom/android/launcher3/FoldHelpTipAty;Landroid/view/View;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->i:Lcom/android/launcher3/FoldHelpTipAty;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->h:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const v0, 0x7f0b00d5

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/CheckBox;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "onClick notRemindAgain="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "AntiPinchHandModeAty"

    .line 34
    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->h:Landroid/content/Context;

    .line 41
    .line 42
    const-string v0, "com.zte.mifavor.launcher.action.DONT_REMIND_ANTI_PINCH_HAND"

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-static {p1, v0, v1}, Lx1/O;->F4(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Lx1/O;->U4(Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/FoldHelpTipAty$a;->i:Lcom/android/launcher3/FoldHelpTipAty;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/FoldHelpTipAty;->finish()V

    .line 54
    .line 55
    .line 56
    return-void
.end method
