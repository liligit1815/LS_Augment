.class public final synthetic Lcom/android/launcher3/E0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/K5$a;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/Hotseat;

.field public final synthetic b:Lcom/android/launcher3/h0;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/E0;->a:Lcom/android/launcher3/Hotseat;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/E0;->b:Lcom/android/launcher3/h0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(I)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/E0;->a:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/E0;->b:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/Hotseat;->L0(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
