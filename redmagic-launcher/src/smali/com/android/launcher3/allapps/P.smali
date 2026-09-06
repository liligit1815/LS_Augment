.class public interface abstract Lcom/android/launcher3/allapps/P;
.super Ljava/lang/Object;
.source "FloatingHeaderRow.java"


# static fields
.field public static final e:[Lcom/android/launcher3/allapps/P;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/allapps/P;

    .line 3
    .line 4
    sput-object v0, Lcom/android/launcher3/allapps/P;->e:[Lcom/android/launcher3/allapps/P;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract a()Z
.end method

.method public abstract b(IZ)V
.end method

.method public abstract c()Z
.end method

.method public abstract d(Lcom/android/launcher3/allapps/FloatingHeaderView;[Lcom/android/launcher3/allapps/P;Z)V
.end method

.method public abstract getExpectedHeight()I
.end method

.method public abstract getFocusedChild()Landroid/view/View;
.end method

.method public abstract getTypeClass()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/android/launcher3/allapps/P;",
            ">;"
        }
    .end annotation
.end method

.method public isVisible()Z
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/allapps/P;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
