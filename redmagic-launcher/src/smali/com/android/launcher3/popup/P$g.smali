.class public Lcom/android/launcher3/popup/P$g;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/l0;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/l0;Landroid/view/View;)V
    .locals 6

    .line 1
    const v1, 0x7f080ad6

    .line 2
    .line 3
    .line 4
    const v2, 0x7f14018f

    .line 5
    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v3, p1

    .line 9
    move-object v4, p2

    .line 10
    move-object v5, p4

    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iput-object p3, v0, Lcom/android/launcher3/popup/P$g;->g:Lcom/android/launcher3/l0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/popup/P$g;->g:Lcom/android/launcher3/l0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/l0;->g(Lcom/android/launcher3/C2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
