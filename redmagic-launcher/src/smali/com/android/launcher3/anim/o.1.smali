.class public final synthetic Lcom/android/launcher3/anim/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/anim/q$d;


# instance fields
.field public final synthetic b:Lcom/android/launcher3/anim/q;

.field public final synthetic c:F

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/anim/q;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/o;->b:Lcom/android/launcher3/anim/q;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/anim/o;->c:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/anim/o;->d:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(FF)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/o;->b:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/anim/o;->c:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/anim/o;->d:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/anim/q;->b(Lcom/android/launcher3/anim/q;FFFF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
