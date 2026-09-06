.class public final synthetic Lcom/android/launcher3/r1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/F3;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/F1;

.field public final synthetic h:Lcom/android/launcher3/J3;

.field public final synthetic i:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/F1;Lcom/android/launcher3/J3;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/r1;->g:Lcom/android/launcher3/F1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/r1;->h:Lcom/android/launcher3/J3;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/r1;->i:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onPrefChanged(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/r1;->g:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/r1;->h:Lcom/android/launcher3/J3;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/r1;->i:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/F1;->Z(Lcom/android/launcher3/F1;Lcom/android/launcher3/J3;Landroid/content/Context;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
