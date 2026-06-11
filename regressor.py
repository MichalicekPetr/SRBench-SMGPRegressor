from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

_SPEC = importlib.util.spec_from_file_location("smgp_root_regressor", ROOT / "regressor.py")
if _SPEC is None or _SPEC.loader is None:
    raise ImportError("Unable to load the root regressor module")

_ROOT_REGRESSOR = importlib.util.module_from_spec(_SPEC)
_SPEC.loader.exec_module(_ROOT_REGRESSOR)

SMGPRegressor = _ROOT_REGRESSOR.SMGPRegressor
_model = _ROOT_REGRESSOR.model


class Regressor(SMGPRegressor):
    """SRBench-compatible wrapper for the Smooth Multifunction Genetic Programming regressor."""


est = Regressor


def model(est, X=None):
    return _model(est, X)
