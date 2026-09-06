.class public final synthetic Lcom/android/launcher3/iconarrange/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/iconarrange/l;

.field public final synthetic h:Lcom/android/launcher3/iconarrange/l$a;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/iconarrange/l;Lcom/android/launcher3/iconarrange/l$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/k;->g:Lcom/android/launcher3/iconarrange/l;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/k;->h:Lcom/android/launcher3/iconarrange/l$a;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/iconarrange/k;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/k;->g:Lcom/android/launcher3/iconarrange/l;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/k;->h:Lcom/android/launcher3/iconarrange/l$a;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/iconarrange/k;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/iconarrange/l;->f(Lcom/android/launcher3/iconarrange/l;Lcom/android/launcher3/iconarrange/l$a;ILandroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
